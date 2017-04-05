//
//  main.swift
//  Class
//
//  Created by 綦 on 17/3/31.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation

//print("Hello, World!")
//var frontDoor : Door = Door()
//frontDoor.open()

var frontDoor = Door.init()
print(frontDoor.width)
frontDoor.lock()
var backWindow = Window.init()
print(backWindow.weight)
backWindow.unlock()

var passwordDoor : PasswordDoor = PasswordDoor.init()
passwordDoor.lock()
passwordDoor.lock(password: "1234")
passwordDoor.unlock(password: "0000")

/// 颜色类型枚举
enum ColorType {
    case RGB
    case CMYK
    case HSB
}
let type: ColorType = .RGB
print(type)

/// 学科枚举
enum Subject: String {
    case Chinese = "语文"
    case Math = "数学"
    case English = "英语"
}
let subjece: Subject = .Chinese
print(subjece)

//结构：与C语言结构体类似，不过Swift结构还包括方法，这使得结构和类十分相似，不过结构没有继承，并且结构是值类型的数据。
struct Color {
    var R: Double = 0.0
    var G: Double = 0.0
    var B: Double = 0.0
    var Alpha: Double = 0.0
    
    func stringValue() -> String {
        let limit: Double = 255.0
        let rInt: Int = Int(self.R*limit)
        let gInt: Int = Int(self.G*limit)
        let bInt: Int = Int(self.B*limit)
        let alphaInt: Int = Int(self.Alpha*limit)
        
        let result: String = String.init(format: "%02X%02X%02X%02X", rInt, gInt, bInt, alphaInt)
        return result
    }
}
let red: Color = Color(R: 1.0, G: 0.0, B: 0.0, Alpha: 1)
print(red)
print(red.stringValue())

/*
 值类型与引用类型:
    值类型：每次赋值都将创建副本，并把副本赋值给新的变量或常量，变量或常量存储的是副本。
    引用类型：说白了，引用类型就是指针，不管赋值给多少变量或者常量，他们都指向同一个对象，变量和常量存储的都是指向这个对象的引用，而不是副本。
*/
/// 结构属于值类型
struct Structure {
    var copyVar: Int = 10;
}
let struct1: Structure = Structure()
var struct2: Structure = struct1
struct2.copyVar = 20
print(struct1)
print(struct2)

/// 对象属于引用类型
class Class {
    var copyVar: Int = 10;
}
let class1: Class = Class()
var class2: Class = class1
class2.copyVar = 20
print(class1.copyVar)
print(class2.copyVar)



