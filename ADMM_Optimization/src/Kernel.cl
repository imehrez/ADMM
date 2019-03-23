#ifndef __OPENCL_VERSION__
#include <OpenCL/OpenCLKernel.hpp> // Hack to make syntax highlighting in Eclipse work
#endif

__kernel void ProximalOperatorKernel (__global const float* d_input, __global float* d_output, float threshold) {
	//TODO
	int i = get_global_id(0);

	if(d_input[i]>=threshold)
	{
		d_output[i] = d_input[i] - threshold;
	}
	else
		if(fabs(d_input[i]) <= threshold)
		{
			d_output[i] = 0;
		}
		else
		{
			d_output[i] = d_input[i] + threshold;
		}
}

__kernel void ProximalOperatorKernel2 (__global const float* d_input, __global float* d_output) {
	//TODO
	int i = get_global_id(0);

	d_output[i] = fmax(d_input[i], 0);
}
__kernel void HadamardMatrixVector (__global const float* d_input1,__global const float* d_input2, __global float* d_output) {

	size_t i = get_global_id(0);
	size_t j = get_global_id(1);

	size_t countX = get_global_size(0);
	size_t countY = get_global_size(1);

	d_output[j + i*countY] = d_input1[j + i*countY]*d_input2[j];


}
