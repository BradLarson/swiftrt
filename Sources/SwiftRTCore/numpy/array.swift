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
import Foundation
import Numerics

// gyb utility docs
// https://nshipster.com/swift-gyb/

//******************************************************************************
//
// DO NOT EDIT. THIS FILE IS GENERATED FROM .swift.gyb file
//
//******************************************************************************

//==============================================================================
/// array
/// Creates a tensor of the given shape and type without initializing the
/// elements
///
/// - Parameters:
///  - elements: a collection of elements used to initialize storage
///  - shape: Int or tuple of Int describing the dimensions of the array
///  - type: data-type, optional
///    Desired output data-type for the array, e.g, Int8. Default is DType.
///  - order: { .C, .F }, optional, default .C
///    Whether to store multi-dimensional data in row-major (C-style)
///    or column-major (Fortran-style) order in memory.
///  - name: optional name
/// - Returns: Tensor of uninitialized (arbitrary) data of the given shape,
///   type, and order. Elements will not be initialized.

//******************************************************************************
// This section converts a flat Collection --> TensorR1
// where shape is implied by count
//******************************************************************************

//************************** Implicit typing

//---------------------------
// from Range
@inlinable public func array(
    _ range: Range<Int>,
    name: String = defaultTensorName
) -> Tensor<Shape1,DType> {
    Tensor<Shape1,DType>(range: range, shape: Shape1(range.count), name: name)
}

//---------------------------
// linear space
@inlinable public func array<E>(
    from first: E,
    to last: E,
    count: Int,
    name: String = defaultTensorName
) -> Tensor<Shape1,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape1,E>(from: first, to: last, shape: Shape1(count), name: name)
}

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C: Collection>(
    stored elements: C,
    name: String = defaultTensorName
) -> Tensor<Shape1,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape1,C.Element>(stored: elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element == C.Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    name: String = defaultTensorName
) -> Tensor<Shape1,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape1,C.Element>(elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element == Int --> DType
@inlinable public func array<C: Collection>(
    _ elements: C,
    name: String = defaultTensorName
) -> Tensor<Shape1,DType> where C.Element == Int {
    Tensor<Shape1,DType>(elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element == Double --> DType
@inlinable public func array<C: Collection>(
    _ elements: C,
    name: String = defaultTensorName
) -> Tensor<Shape1,DType> where C.Element == Double {
    Tensor<Shape1,DType>(elements, shape: Shape1(elements.count), name: name)
}

//************************** Explicit typing

//---------------------------
// C.Element Bool --> numeric Element.Value
@inlinable public func array<C: Collection, Element: StorageElement>(
    _ elements: C,
    type: Element.Type,
    name: String = defaultTensorName
) -> Tensor<Shape1,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape1, Element>(elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element numeric --> Bool
@inlinable public func array<C: Collection, Element: StorageElement>(
    _ elements: C,
    type: Element.Type,
    name: String = defaultTensorName
) -> Tensor<Shape1,Bool> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape1,Bool>(elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element Bool --> Bool1
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    type: Element.Type,
    name: String = defaultTensorName
) -> Tensor<Shape1,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape1,Element>(elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C: Collection, Element: StorageElement>(
    _ elements: C,
    type: Element.Type,
    name: String = defaultTensorName
) -> Tensor<Shape1,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric
{
    Tensor<Shape1, Element>(elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C: Collection, Element: StorageElement>(
    _ elements: C,
    type: Element.Type,
    name: String = defaultTensorName
) -> Tensor<Shape1,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint
{
    Tensor<Shape1, Element>(elements, shape: Shape1(elements.count), name: name)
}

//---------------------------
// C.Element floating --> integer Element.Value
@inlinable public func array<C: Collection, Element: StorageElement>(
    _ elements: C,
    type: Element.Type,
    name: String = defaultTensorName
) -> Tensor<Shape1,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger
{
    Tensor<Shape1,Element>(elements, shape: Shape1(elements.count), name: name)
}

//******************************************************************************
// This section converts a flat Collection --> shaped Tensor
//******************************************************************************

//------------------------------------------------------------------------------
// Rank2
//************************** Implicit typing

//---------------------------
// from Range
@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape2.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType> {
    Tensor<Shape2,DType>(range: range, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape2,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType> {
    Tensor<Shape2,DType>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// linear space
@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape2.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape2,E>(from: first, to: last, shape: Shape2(shape),
                        order: order, name: name)
}

@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape2,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape2,E>(from: first, to: last, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape2.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape2,C.Element>(stored: elements, shape: Shape2(shape),
                                order: order, name: name)
}

@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape2,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape2,C.Element>(stored: elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape2.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape2,C.Element>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape2,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape2,C.Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape2.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType> where C.Element == Int {
    Tensor<Shape2,DType>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape2,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType> where C.Element == Int {
    Tensor<Shape2,DType>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape2.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType> where C.Element == Double {
    Tensor<Shape2,DType>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape2,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType> where C.Element == Double {
    Tensor<Shape2,DType>(elements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// from Range
@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape2.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where Element.Value: Numeric {
    Tensor<Shape2,Element>(range: range, shape: Shape2(shape),
                            order: order, name: name)
}

@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape2,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where Element.Value: Numeric {
    Tensor<Shape2,Element>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape2,Element>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape2,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Numeric --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape2,Element>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape2,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape2,Element>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape2,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape2,Element>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape2,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape2,Element>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape2,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> integer Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape2,Element>(elements, shape: Shape2(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape2,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape2,Element>(elements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank3
//************************** Implicit typing

//---------------------------
// from Range
@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape3.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType> {
    Tensor<Shape3,DType>(range: range, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape3,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType> {
    Tensor<Shape3,DType>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// linear space
@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape3.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape3,E>(from: first, to: last, shape: Shape3(shape),
                        order: order, name: name)
}

@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape3,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape3,E>(from: first, to: last, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape3.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape3,C.Element>(stored: elements, shape: Shape3(shape),
                                order: order, name: name)
}

@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape3,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape3,C.Element>(stored: elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape3.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape3,C.Element>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape3,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape3,C.Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape3.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType> where C.Element == Int {
    Tensor<Shape3,DType>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape3,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType> where C.Element == Int {
    Tensor<Shape3,DType>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape3.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType> where C.Element == Double {
    Tensor<Shape3,DType>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape3,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType> where C.Element == Double {
    Tensor<Shape3,DType>(elements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// from Range
@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape3.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where Element.Value: Numeric {
    Tensor<Shape3,Element>(range: range, shape: Shape3(shape),
                            order: order, name: name)
}

@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape3,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where Element.Value: Numeric {
    Tensor<Shape3,Element>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape3,Element>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape3,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Numeric --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape3,Element>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape3,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape3,Element>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape3,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape3,Element>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape3,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape3,Element>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape3,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> integer Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape3,Element>(elements, shape: Shape3(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape3,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape3,Element>(elements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank4
//************************** Implicit typing

//---------------------------
// from Range
@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape4.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType> {
    Tensor<Shape4,DType>(range: range, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape4,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType> {
    Tensor<Shape4,DType>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// linear space
@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape4.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape4,E>(from: first, to: last, shape: Shape4(shape),
                        order: order, name: name)
}

@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape4,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape4,E>(from: first, to: last, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape4.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape4,C.Element>(stored: elements, shape: Shape4(shape),
                                order: order, name: name)
}

@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape4,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape4,C.Element>(stored: elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape4.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape4,C.Element>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape4,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape4,C.Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape4.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType> where C.Element == Int {
    Tensor<Shape4,DType>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape4,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType> where C.Element == Int {
    Tensor<Shape4,DType>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape4.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType> where C.Element == Double {
    Tensor<Shape4,DType>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape4,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType> where C.Element == Double {
    Tensor<Shape4,DType>(elements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// from Range
@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape4.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where Element.Value: Numeric {
    Tensor<Shape4,Element>(range: range, shape: Shape4(shape),
                            order: order, name: name)
}

@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape4,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where Element.Value: Numeric {
    Tensor<Shape4,Element>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape4,Element>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape4,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Numeric --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape4,Element>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape4,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape4,Element>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape4,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape4,Element>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape4,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape4,Element>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape4,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> integer Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape4,Element>(elements, shape: Shape4(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape4,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape4,Element>(elements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank5
//************************** Implicit typing

//---------------------------
// from Range
@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape5.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType> {
    Tensor<Shape5,DType>(range: range, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape5,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType> {
    Tensor<Shape5,DType>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// linear space
@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape5.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape5,E>(from: first, to: last, shape: Shape5(shape),
                        order: order, name: name)
}

@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape5,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape5,E>(from: first, to: last, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape5.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape5,C.Element>(stored: elements, shape: Shape5(shape),
                                order: order, name: name)
}

@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape5,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape5,C.Element>(stored: elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape5.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape5,C.Element>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape5,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape5,C.Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape5.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType> where C.Element == Int {
    Tensor<Shape5,DType>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape5,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType> where C.Element == Int {
    Tensor<Shape5,DType>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape5.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType> where C.Element == Double {
    Tensor<Shape5,DType>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape5,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType> where C.Element == Double {
    Tensor<Shape5,DType>(elements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// from Range
@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape5.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where Element.Value: Numeric {
    Tensor<Shape5,Element>(range: range, shape: Shape5(shape),
                            order: order, name: name)
}

@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape5,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where Element.Value: Numeric {
    Tensor<Shape5,Element>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape5,Element>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape5,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Numeric --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape5,Element>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape5,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape5,Element>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape5,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape5,Element>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape5,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape5,Element>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape5,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> integer Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape5,Element>(elements, shape: Shape5(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape5,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape5,Element>(elements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank6
//************************** Implicit typing

//---------------------------
// from Range
@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape6.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType> {
    Tensor<Shape6,DType>(range: range, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array(
    _ range: Range<Int>,
    shape: Shape6,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType> {
    Tensor<Shape6,DType>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// linear space
@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape6.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape6,E>(from: first, to: last, shape: Shape6(shape),
                        order: order, name: name)
}

@inlinable public func array<E>(
    from first: E,
    to last: E,
    shape: Shape6,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,E> where E == E.Value, E: AlgebraicField {
    Tensor<Shape6,E>(from: first, to: last, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape6.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape6,C.Element>(stored: elements, shape: Shape6(shape),
                                order: order, name: name)
}

@inlinable public func array<C: Collection>(
    stored elements: C,
    shape: Shape6,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,C.Element> where C.Element == C.Element.Stored {
    Tensor<Shape6,C.Element>(stored: elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape6.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape6,C.Element>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape6,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,C.Element> where C.Element == C.Element.Value {
    Tensor<Shape6,C.Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape6.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType> where C.Element == Int {
    Tensor<Shape6,DType>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape6,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType> where C.Element == Int {
    Tensor<Shape6,DType>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape6.Tuple,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType> where C.Element == Double {
    Tensor<Shape6,DType>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection>(
    _ elements: C,
    shape: Shape6,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType> where C.Element == Double {
    Tensor<Shape6,DType>(elements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// from Range
@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape6.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where Element.Value: Numeric {
    Tensor<Shape6,Element>(range: range, shape: Shape6(shape),
                            order: order, name: name)
}

@inlinable public func array<Element>(
    _ range: Range<Int>,
    shape: Shape6,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where Element.Value: Numeric {
    Tensor<Shape6,Element>(range: range, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape6,Element>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where C.Element == Bool, Element.Value: Numeric {
    Tensor<Shape6,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Numeric --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape6,Element>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where C.Element: Numeric, Element.Value == Bool {
    Tensor<Shape6,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape6,Element>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element> where C.Element == Bool, Element.Value == Bool {
    Tensor<Shape6,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape6,Element>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where C.Element: BinaryInteger, Element.Value: Numeric {
    Tensor<Shape6,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape6,Element>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryFloatingPoint {
    Tensor<Shape6,Element>(elements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> integer Element.Value
@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6.Tuple,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape6,Element>(elements, shape: Shape6(shape), order: order, name: name)
}

@inlinable public func array<C: Collection, Element>(
    _ elements: C,
    shape: Shape6,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where C.Element: BinaryFloatingPoint, Element.Value: BinaryInteger {
    Tensor<Shape6,Element>(elements, shape: shape, order: order, name: name)
}


//******************************************************************************
// This section converts a Collection of collections --> shaped Tensor
// Swift Arrays are converted using this section
//******************************************************************************

//------------------------------------------------------------------------------
// Rank2
//************************** Implicit typing

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C>(
    stored elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,C.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element == C.Element.Element.Stored
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,C.Element.Element>(
        stored: flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,C.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element == C.Element.Element.Value
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,C.Element.Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Int --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element == Int
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Double --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element == Double
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// C.Element Bool --> numeric Element.Value
@inlinable public func array<C,Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element == Bool, Element.Value: Numeric
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element == Bool, Element.Value == Bool
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: BinaryInteger, Element.Value: Numeric
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryFloatingPoint
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape2,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryInteger
{
    let shape = Shape2(
        elements.count,
        elements.first!.count)

    let flatElements = elements.joined()
    return Tensor<Shape2,Element>(flatElements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank3
//************************** Implicit typing

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C>(
    stored elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,C.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element == C.Element.Element.Element.Stored
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,C.Element.Element.Element>(
        stored: flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,C.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element == C.Element.Element.Element.Value
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,C.Element.Element.Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Int --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element == Int
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Double --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element == Double
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// C.Element Bool --> numeric Element.Value
@inlinable public func array<C,Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element == Bool, Element.Value: Numeric
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element == Bool, Element.Value == Bool
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: BinaryInteger, Element.Value: Numeric
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryFloatingPoint
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape3,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryInteger
{
    let shape = Shape3(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count)

    let flatElements = elements.joined().joined()
    return Tensor<Shape3,Element>(flatElements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank4
//************************** Implicit typing

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C>(
    stored elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,C.Element.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element == C.Element.Element.Element.Element.Stored
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,C.Element.Element.Element.Element>(
        stored: flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,C.Element.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element == C.Element.Element.Element.Element.Value
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,C.Element.Element.Element.Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Int --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element == Int
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Double --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element == Double
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// C.Element Bool --> numeric Element.Value
@inlinable public func array<C,Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element == Bool, Element.Value: Numeric
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element == Bool, Element.Value == Bool
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: BinaryInteger, Element.Value: Numeric
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryFloatingPoint
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape4,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryInteger
{
    let shape = Shape4(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined()
    return Tensor<Shape4,Element>(flatElements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank5
//************************** Implicit typing

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C>(
    stored elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,C.Element.Element.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element == C.Element.Element.Element.Element.Element.Stored
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,C.Element.Element.Element.Element.Element>(
        stored: flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,C.Element.Element.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element == C.Element.Element.Element.Element.Element.Value
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,C.Element.Element.Element.Element.Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Int --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element == Int
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Double --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element == Double
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// C.Element Bool --> numeric Element.Value
@inlinable public func array<C,Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element == Bool, Element.Value: Numeric
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element == Bool, Element.Value == Bool
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: BinaryInteger, Element.Value: Numeric
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryFloatingPoint
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape5,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryInteger
{
    let shape = Shape5(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined()
    return Tensor<Shape5,Element>(flatElements, shape: shape, order: order, name: name)
}

//------------------------------------------------------------------------------
// Rank6
//************************** Implicit typing

//---------------------------
// C.Element == Element.Stored
@inlinable public func array<C>(
    stored elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,C.Element.Element.Element.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element == C.Element.Element.Element.Element.Element.Element.Stored
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,C.Element.Element.Element.Element.Element.Element>(
        stored: flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Element.Value
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,C.Element.Element.Element.Element.Element.Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element == C.Element.Element.Element.Element.Element.Element.Value
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,C.Element.Element.Element.Element.Element.Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Int --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element == Int
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element == Double --> DType
@inlinable public func array<C>(
    _ elements: C,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,DType>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element == Double
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,DType>(
        flatElements, shape: shape, order: order, name: name)
}

//************************** Explicit typing

//---------------------------
// C.Element Bool --> numeric Element.Value
@inlinable public func array<C,Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element == Bool, Element.Value: Numeric
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,Element>(
        flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element Bool --> Bool
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element == Bool, Element.Value == Bool
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element integer --> numeric Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element: BinaryInteger, Element.Value: Numeric
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryFloatingPoint
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,Element>(flatElements, shape: shape, order: order, name: name)
}

//---------------------------
// C.Element floating --> floating Element.Value
@inlinable public func array<C, Element>(
    _ elements: C,
    type: Element.Type,
    order: Order = .defaultOrder,
    name: String = defaultTensorName
) -> Tensor<Shape6,Element>
    where
    C: Collection,
    C.Element: Collection,
    C.Element.Element: Collection,
    C.Element.Element.Element: Collection,
    C.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element: Collection,
    C.Element.Element.Element.Element.Element.Element: BinaryFloatingPoint,
    Element.Value: BinaryInteger
{
    let shape = Shape6(
        elements.count,
        elements.first!.count,
        elements.first!.first!.count,
        elements.first!.first!.first!.count,
        elements.first!.first!.first!.first!.count,
        elements.first!.first!.first!.first!.first!.count)

    let flatElements = elements.joined().joined().joined().joined().joined()
    return Tensor<Shape6,Element>(flatElements, shape: shape, order: order, name: name)
}


//******************************************************************************
// This section converts Tensor --> Swift Array
//******************************************************************************

//------------------------------------------------------------------------------
// Rank1 to Swift Array
public extension Tensor where Shape == Shape1 {
    @inlinable var array: [Element] {
        usingSyncQueue {
            isContiguous ? [Element](buffer) : [Element](elements)
        }
    }
}

//------------------------------------------------------------------------------
// Rank2 to Swift Array
public extension Tensor where Shape == Shape2 {
    @inlinable var array: [[Element]] {
        usingSyncQueue {
            var array2 = [[Element]]()
            for d0 in 0..<shape[0] {
                let row = self[d0, 0...]
                let elements = row.isContiguous && row.order == .row ?
                    [Element](row.buffer) : [Element](row.elements)
                array2.append(elements)
            }
            return array2
        }
    }
}

//------------------------------------------------------------------------------
// Rank3 to Swift Array
public extension Tensor where Shape == Shape3 {
    @inlinable var array: [[[Element]]] {
        usingSyncQueue {
            var array3 = [[[Element]]]()
            for d0 in 0..<shape[0] {
                var array2 = [[Element]]()
                for d1 in 0..<shape[1] {
                    let row = self[d0, d1, 0...]
                    let elements = row.isContiguous && row.order == .row ?
                        [Element](row.buffer) : [Element](row.elements)
                    array2.append(elements)
                }
                array3.append(array2)
            }
            return array3
        }
    }
}

//------------------------------------------------------------------------------
// Rank4 to Swift Array
public extension Tensor where Shape == Shape4 {
    @inlinable var array: [[[[Element]]]] {
        usingSyncQueue {
            var array4 = [[[[Element]]]]()
            for d0 in 0..<shape[0] {
                var array3 = [[[Element]]]()
                for d1 in 0..<shape[1] {
                    var array2 = [[Element]]()
                    for d2 in 0..<shape[2] {
                        let row = self[d0, d1, d2, 0...]
                        let elements = row.isContiguous && row.order == .row ?
                            [Element](row.buffer) : [Element](row.elements)
                        array2.append(elements)
                    }
                    array3.append(array2)
                }
                array4.append(array3)
            }
            return array4
        }
    }
}

//------------------------------------------------------------------------------
// Rank5 to Swift Array
public extension Tensor where Shape == Shape5 {
    @inlinable var array: [[[[[Element]]]]] {
        usingSyncQueue {
            var array5 = [[[[[Element]]]]]()
            for d0 in 0..<shape[0] {
                var array4 = [[[[Element]]]]()
                for d1 in 0..<shape[1] {
                    var array3 = [[[Element]]]()
                    for d2 in 0..<shape[2] {
                        var array2 = [[Element]]()
                        for d3 in 0..<shape[3] {
                            let row = self[d0, d1, d2, d3, 0...]
                            let elements = row.isContiguous && row.order == .row ?
                                [Element](row.buffer) : [Element](row.elements)
                            array2.append(elements)
                        }
                        array3.append(array2)
                    }
                    array4.append(array3)
                }
                array5.append(array4)
            }
            return array5
        }
    }
}

//------------------------------------------------------------------------------
// Rank6 to Swift Array
public extension Tensor where Shape == Shape6 {
    @inlinable var array: [[[[[[Element]]]]]] {
        usingSyncQueue {
            var array6 = [[[[[[Element]]]]]]()
            for d0 in 0..<shape[0] {
                var array5 = [[[[[Element]]]]]()
                for d1 in 0..<shape[1] {
                    var array4 = [[[[Element]]]]()
                    for d2 in 0..<shape[2] {
                        var array3 = [[[Element]]]()
                        for d3 in 0..<shape[3] {
                            var array2 = [[Element]]()
                            for d4 in 0..<shape[4] {
                                let row = self[d0, d1, d2, d3, d4, 0...]
                                let elements = row.isContiguous && row.order == .row ?
                                    [Element](row.buffer) : [Element](row.elements)
                                array2.append(elements)
                            }
                            array3.append(array2)
                        }
                        array4.append(array3)
                    }
                    array5.append(array4)
                }
                array6.append(array5)
            }
            return array6
        }
    }
}


//==============================================================================
/// Equatable
public extension Tensor where Shape == Shape1, Element: Equatable {
    @inlinable static func == (lhs: Self, rhs: [Element]) -> Bool {
        lhs.array == rhs
    }
}

public extension Tensor where Shape == Shape2, Element: Equatable {
    @inlinable static func == (lhs: Self, rhs: [[Element]]) -> Bool {
        lhs.array == rhs
    }
}

public extension Tensor where Shape == Shape3, Element: Equatable {
    @inlinable static func == (lhs: Self, rhs: [[[Element]]]) -> Bool {
        lhs.array == rhs
    }
}

public extension Tensor where Shape == Shape4, Element: Equatable {
    @inlinable static func == (lhs: Self, rhs: [[[[Element]]]]) -> Bool {
        lhs.array == rhs
    }
}

public extension Tensor where Shape == Shape5, Element: Equatable {
    @inlinable static func == (lhs: Self, rhs: [[[[[Element]]]]]) -> Bool {
        lhs.array == rhs
    }
}

public extension Tensor where Shape == Shape6, Element: Equatable {
    @inlinable static func == (lhs: Self, rhs: [[[[[[Element]]]]]]) -> Bool {
        lhs.array == rhs
    }
}


