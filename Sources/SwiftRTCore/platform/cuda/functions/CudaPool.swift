//******************************************************************************
// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftRTCuda

//==============================================================================
// DeviceQueue functions with default cpu delegation
extension CudaQueue {
  //--------------------------------------------------------------------------
  @inlinable public func pool<S, E>(
    _ x: Tensor<S, E>,
    _ size: S,
    _ strides: S,
    _ pad: Padding,
    _ mode: PoolingMode,
    _ out: inout Tensor<S, E>
  ) {
    // var status: cudaError_t
    assert(out.isContiguous, _messageElementsMustBeContiguous)
    guard useGpu else {
      cpu_pool(x, size, strides, pad, mode, &out)
      return
    }

    let _ = PoolingConfiguration(
      x: x, size: size, strides: strides, pad: pad, mode: mode, out: &out
    )

  }

}

//----------------------------------------------------------------------------
public class PoolingConfiguration {
  let poolingDesc: PoolingDescriptor
  // let xDesc: TensorDescriptor
  // let outDesc: TensorDescriptor

  @inlinable public init<S, E>(
    x: Tensor<S, E>,
    size: S,
    strides: S,
    pad: Padding,
    mode: PoolingMode,
    out: inout Tensor<S, E>
  ) {
    // create descriptor
    // let poolingRank = inData.extent.count - 2
    let padding = S.zero
    // let padding = expand(array: props.pad, to: poolingRank)
    // let windowSize = expand(array: props.windowSize, to: poolingRank)
    // let stride = expand(array: props.stride, to: poolingRank)

    poolingDescriptor = PoolingDescriptor(
      mode: mode,
      nan: .propagate,
      window: size,
      padding: padding,
      strides: strides)

    // // create input tensor descriptor
    // inTensor = try inData.createTensorDescriptor()

    // // assure the output is the correct type and size
    // var outDims = [Int32](repeating: 0, count: inData.extent.count)
    // try cudaCheck(
    //   status: cudnnGetPoolingNdForwardOutputDim(
    //     poolingDescriptor.desc, inTensor.desc, Int32(inData.extent.count), &outDims))

    // // create output
    // let outShape = Shape(extent: outDims.map { Int($0) })
    // outData = DataView(shape: outShape, dataType: props.outDataType)
    // outTensor = try outData.createTensorDescriptor()
  }

}

//==============================================================================
// PoolingDescriptor
public struct PoolingDescriptor<Shape: TensorShape> {	
	// properties
	let desc: cudnnPoolingDescriptor_t

	// initializers
	public init(
    mode: PoolingMode,
    nan: NanPropagation,
    window: Shape,
	  padding: Shape,
    stride: Shape
  ) {
		// create the descriptor
		var temp: cudnnPoolingDescriptor_t?
		try cudaCheck(status: cudnnCreatePoolingDescriptor(&temp))
		desc = temp!
		
		// initialize
		try cudaCheck(status: cudnnSetPoolingNdDescriptor(
			desc,
      mode.cudnn,
      nan.cudnn,
			CInt(Shape.rank),
			window.map { CInt($0) },
			padding.map { CInt($0) },
			stride.map { CInt($0) }))
	}

	deinit {
		cudaCheck(cudnnDestroyLRNDescriptor(desc))
	}
}