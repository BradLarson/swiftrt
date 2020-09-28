//******************************************************************************
// Copyright 2019 Google LLC
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
#include <assert.h>
#include <stdio.h>
#include "compareOps.h"
#include "compareSupplemental.h"
#include "dispatchHelpers.h"

//==============================================================================
// Swift importable C interface functions
//==============================================================================

//------------------------------------------------------------------------------
OpTT(And, andElements, (isBool<T>() && isBool<Out>()))

cudaError_t srtAnd(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<And>(a, aDesc, b, bDesc, out, oDesc, stream);
}

//------------------------------------------------------------------------------

cudaError_t srtElementsAlmostEqual(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    const void* tolerance,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    return cudaErrorNotSupported;
}

//------------------------------------------------------------------------------
OpTT(Equal, equalElements, isBool<Out>())

cudaError_t srtEqual(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<Equal>(a, aDesc, b, bDesc, out, oDesc, stream);
}

//------------------------------------------------------------------------------
OpTT(Greater, greaterElements, isBool<Out>())

cudaError_t srtGreater(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<Greater>(a, aDesc, b, bDesc, out, oDesc, stream);
}

cudaError_t srtGreaterTE(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* element,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsA(paDesc, poDesc)
    return select<Greater>(a, aDesc, element, out, oDesc, stream);
}
    
//------------------------------------------------------------------------------
OpTT(GreaterOrEqual, greaterOrEqualElements, isBool<Out>())

cudaError_t srtGreaterOrEqual(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<GreaterOrEqual>(a, aDesc, b, bDesc, out, oDesc, stream);
}

cudaError_t srtGreaterOrEqualTE(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* element,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsA(paDesc, poDesc)
    return select<GreaterOrEqual>(a, aDesc, element, out, oDesc, stream);
}
    
//------------------------------------------------------------------------------
OpTT(Less, lessElements, isBool<Out>())

cudaError_t srtLess(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<Less>(a, aDesc, b, bDesc, out, oDesc, stream);
}

cudaError_t srtLessTE(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* element,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsA(paDesc, poDesc)
    return select<Less>(a, aDesc, element, out, oDesc, stream);
}
    
//------------------------------------------------------------------------------
OpTT(LessOrEqual, lessOrEqualElements, isBool<Out>())

cudaError_t srtLessOrEqual(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<LessOrEqual>(a, aDesc, b, bDesc, out, oDesc, stream);
}

cudaError_t srtLessOrEqualTE(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* element,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsA(paDesc, poDesc)
    return select<LessOrEqual>(a, aDesc, element, out, oDesc, stream);
}
    
//------------------------------------------------------------------------------
OpTT(MinElements, minElements, (isNumeric<T>() && isSame<T, Out>()))

cudaError_t srtMin(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<MinElements>(a, aDesc, b, bDesc, out, oDesc, stream);
}

cudaError_t srtMinTE(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* element,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsA(paDesc, poDesc)
    return select<MinElements>(a, aDesc, element, out, oDesc, stream);
}
    
//------------------------------------------------------------------------------
OpTT(MaxElements, maxElements, (isNumeric<T>() && isSame<T, Out>()))

cudaError_t srtMax(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<MaxElements>(a, aDesc, b, bDesc, out, oDesc, stream);
}

cudaError_t srtMaxTE(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* element,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream
) {
    Cast2TensorDescriptorsA(paDesc, poDesc)
    return select<MaxElements>(a, aDesc, element, out, oDesc, stream);
}
    
//------------------------------------------------------------------------------
OpTT(NotEqualElements, notEqualElements, isBool<Out>())

cudaError_t srtNotEqual(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<NotEqualElements>(a, aDesc, b, bDesc, out, oDesc, stream);
}

//------------------------------------------------------------------------------
OpTT(Or, orElements, (isBool<T>() && isBool<Out>()))

cudaError_t srtOr(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    Cast2TensorDescriptorsAB(paDesc, pbDesc, poDesc)
    return select<Or>(a, aDesc, b, bDesc, out, oDesc, stream);
}

//------------------------------------------------------------------------------

cudaError_t srtReplace(
    const void* a, const srtTensorDescriptor* paDesc,
    const void* b, const srtTensorDescriptor* pbDesc,
    const void* condition, const srtTensorDescriptor* cDesc,
    void* out, const srtTensorDescriptor* poDesc,
    cudaStream_t stream)
{
    return cudaErrorNotSupported;
}
