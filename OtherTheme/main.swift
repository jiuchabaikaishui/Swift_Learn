//
//  main.swift
//  OtherTheme
//
//  Created by 綦 on 17/4/5.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation

//循环引用
class ClassA {
    var b: ClassB!
    //销毁时调用
    deinit {
        print("\(type(of: self)) 销毁了！")
    }
}
class ClassB {
    var a: ClassA!
    //销毁时调用
    deinit {
        print("\(type(of: self)) 销毁了！")
    }
}
var aClass: ClassA! = ClassA()
var bClass: ClassB! = ClassB()
aClass.b = bClass
bClass.a = aClass

//使用"weak"可以解决对象之间相互引用而造成的循环引用
class ClassC {
    var d: ClassD!
    //销毁时调用
    deinit {
        print("\(type(of: self)) 销毁了！")
    }
}
class ClassD {
    weak var c: ClassC!
    //销毁时调用
    deinit {
        print("\(type(of: self)) 销毁了！")
    }
}
var cClass: ClassC! = ClassC()
var dClass: ClassD! = ClassD()
cClass.d = dClass
dClass.c = cClass
cClass = nil
dClass = nil

/*
 闭包内的循环引用：闭包是引用类型的数据，类的实例变量强引用了闭包，而如果闭包中再引用了类对象的话，就会造成循环引用
 
 解决办法：在闭包定义中添加"[unowned self] in"可以解决闭包内的循环引用
*/
class Student {
    var name: String = ""
    var age: Int = 0
    lazy var info: () -> Void = {
        print("name:\(self.name), age:\(self.age)")
    }
    
    deinit {
        print("\(type(of: self)) 销毁了！")
    }
}
var student: Student! = Student()
student.name = "张三"
student.age = 10
student.info()
student = nil
class People {
    var name: String = ""
    var age: Int = 0
    lazy var info: () -> Void = { [unowned self] in
        print("name:\(self.name), age:\(self.age)")
    }
    
    deinit {
        print("\(type(of: self)) 销毁了！")
    }
}
var people: People! = People()
people.name = "张三"
people.age = 10
people.info()
people = nil

//泛型：不指定数据的类型，只是指定一个占位符
func valueEqual<T: Equatable>(value1: T, value2: T) -> Bool {
    return value1 == value2
}

//运算符重载：只需定义一个运算符命名的函数
/// 二维矩阵结构体
struct TwoDimensionalMatrix {
    var a11: Double, a12: Double
    var a21: Double, a22: Double
}
/// 重载+运算符，实现二维矩阵的相加
func +(matrix: TwoDimensionalMatrix, otherMatrix: TwoDimensionalMatrix) -> TwoDimensionalMatrix {
    return TwoDimensionalMatrix.init(a11: matrix.a11 + otherMatrix.a11, a12: matrix.a12 + otherMatrix.a12, a21: matrix.a21 + otherMatrix.a21, a22: matrix.a22 + otherMatrix.a22)
}
/// 重载*运算符，实现二维矩阵的相乘
func *(matrix: TwoDimensionalMatrix, otherMatrix: TwoDimensionalMatrix) -> TwoDimensionalMatrix {
    return TwoDimensionalMatrix.init(a11: matrix.a11 * otherMatrix.a11, a12: matrix.a12 * otherMatrix.a12, a21: matrix.a21 * otherMatrix.a21, a22: matrix.a22 * otherMatrix.a22)
}
let matrix: TwoDimensionalMatrix = TwoDimensionalMatrix.init(a11: 1, a12: 2, a21: 3, a22: 4)
let otherMatrix: TwoDimensionalMatrix = TwoDimensionalMatrix.init(a11: 1, a12: 2, a21: 3, a22: 4)
print(matrix + otherMatrix)
print(matrix * otherMatrix)

//相等和相同
//相等是指值相等
//相同是指指向的对象为同一个对象
let a: Int = 1
let b: Int = 1
class IntClass {
    var value: Int = 0
    init(value: Int) {
        self.value = value
    }
}
let intA: IntClass = IntClass.init(value: 1)
let intB: IntClass = IntClass.init(value: 1)
print(a == b)
print(a != b)
print(intA === intB)
print(intA !== intB)
