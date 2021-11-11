/*
===============================================================================
 Name        : main.cpp
 Author      : Aness Al-Qawlaq
 Version     : v10
 Copyright   : Tyndall
 Description : Code to run TFLite model on board LPC1768
===============================================================================
*/

#ifdef __USE_CMSIS
#include "LPC17xx.h"
#endif

#include <cr_section_macros.h>

// TODO: insert other include files here
#include <stdio.h>
#include "tensorflow/lite/micro/kernels/micro_ops.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_mutable_op_resolver.h"
#include "bruxSmallFIX.h"
#include "sanityData.h"

// TODO: insert other definitions and declarations here

char statStr[80];

extern "C" {
	#include "uart.h"
	#include "timerlib.h"
}

extern "C" void DebugLog(const char* s){
	uart_printf((char *)s);
}



// TFLite globals
namespace {
  tflite::ErrorReporter* error_reporter = nullptr;
  const tflite::Model* model = nullptr;
  tflite::MicroInterpreter* interpreter = nullptr;
  TfLiteTensor* model_input = nullptr;
  TfLiteTensor* model_output = nullptr;

  // Create an area of memory to use for input, output, and other TensorFlow
  // arrays. You'll need to adjust this by compiling, running, and looking
  // for errors.
  constexpr int kTensorArenaSize = 3 * 1024;
  __attribute__((aligned(16)))uint8_t tensor_arena[kTensorArenaSize];
} // namespace


int main(void) {
	uart_init(115200);
	char buf[50];
//	int buf_len = 0;
	TfLiteStatus tflite_status;
	uint32_t num_elements;
//	float inputData[] = {0.170423812090902f, 1.51506737f, -1.095987519f, -0.469311303f, -0.004425957f, -1.225847671f, 0.807736563f, 0.646091668f, -1.030670113f, 1.108381867f};
	float y_val[6];

	// Set up logging (modify tensorflow/lite/micro/debug_log.cc)
	static tflite::MicroErrorReporter micro_error_reporter;
	error_reporter = &micro_error_reporter;

	// Say something to test error reporter
	error_reporter->Report("LPC1768 TensorFlow Lite test");

	// Map the model into a usable data structure
	model = tflite::GetModel(bruxSmallFIX);
	if (model->version() != TFLITE_SCHEMA_VERSION){
		error_reporter->Report("Model version does not match Schema");
		while(1);
	}

	// Pull in only needed operations (should match NN layers). Template parameter
	// <n> is number of ops to be added. Available ops:
	// tensorflow/lite/micro/kernels/micro_ops.h
	static tflite::MicroMutableOpResolver<8> micro_op_resolver;

	// Add dense neural network layer operation
	tflite_status = micro_op_resolver.AddFullyConnected();
	tflite_status = micro_op_resolver.AddLogistic();
	tflite_status = micro_op_resolver.AddReshape();
	tflite_status = micro_op_resolver.AddRelu();
	tflite_status = micro_op_resolver.AddSoftmax();
	tflite_status = micro_op_resolver.AddConv2D();
	tflite_status = micro_op_resolver.AddQuantize();
	tflite_status = micro_op_resolver.AddDequantize();
	if (tflite_status != kTfLiteOk){
		error_reporter->Report("Could not add all ops");
		while(1);
	}
	else{
		error_reporter->Report("all is well");
	}

	// Build an interpreter to run the model with.
	static tflite::MicroInterpreter static_interpreter(model, micro_op_resolver, tensor_arena, kTensorArenaSize, error_reporter);
	interpreter = &static_interpreter;

	// Allocate memory from the tensor_arena for the model's tensors.
	tflite_status = interpreter->AllocateTensors();
	if (tflite_status != kTfLiteOk){
		error_reporter->Report("AllocateTensors() failed");
		while(1);
	}

	// Assign model input and output buffers (tensors) to pointers
	model_input = interpreter->input(0);
	model_output = interpreter->output(0);

	// Get number of elements in input tensor
	num_elements = model_input->bytes / sizeof(float);
	sprintf(buf, "Number of input elements: %lu\r\n", num_elements);
	uart_printf(buf);

    while(1) {
    	sprintf(buf, "INVOKING BEGAN: %lu\r\n", num_elements);
		uart_printf(buf);
//		 Fill input buffer (use test value)
    	for (uint32_t i = 0; i < num_elements; i++){
		  model_input->data.f[i] = sanityData[i];
		}

		// Run inference
		tflite_status = interpreter->Invoke();
		if (tflite_status != kTfLiteOk){
		  error_reporter->Report("Invoke failed");
		}

		// Read output (predicted y) of neural network
		for(int i =0; i<6; i++){
			y_val[i] = model_output->data.f[i];
		}

		sprintf(buf, "INVOKING COMPLETE: %lu\r\n", num_elements);
		uart_printf(buf);
		// Print output of neural network along with inference time (microseconds)
		for(int i =0; i<6; i++){
			sprintf(buf,"Output %d: %f\r\n", i, y_val[i]);
			uart_printf(buf);
		}

		// Wait before doing it again
		delayMS(50);
    }
    return 0 ;
}
