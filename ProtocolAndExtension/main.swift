//
//  main.swift
//  ProtocolAndExtension
//
//  Created by 綦 on 17/4/5.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation
/*
 协议：指定了类和结构需要实现的方法和变量
 */
protocol LockUnlockProtocol {
    var locked: Bool {get set}
    
    func lock() -> String
    func unlock() -> String
}

class House: LockUnlockProtocol {
    var locked: Bool = false
    
    func lock() -> String {
        locked = true
        return "Click!"
    }
    func unlock() -> String {
        locked = false
        return "Clack!"
    }
}

class Vehicle: LockUnlockProtocol {
    var locked: Bool = false
    
    func lock() -> String {
        locked = true
        return "Beep-Beep!"
    }
    func unlock() -> String {
        locked = false
        return "Beep!"
    }
}

let myHouse: House = House()
print(myHouse.lock())
print(myHouse.unlock())
let myCar: Vehicle = Vehicle()
print(myCar.lock())
print(myCar.unlock())

//多协议
protocol AreaComputetionProtocol {
    func computeArea() -> Double
}
protocol PerimeterComputetionProtocol {
    func computePerimeter() -> Double
}
struct RectAngle: AreaComputetionProtocol, PerimeterComputetionProtocol {
    var width, height: Double
    
    internal func computeArea() -> Double {
        return width*height
    }

    internal func computePerimeter() -> Double {
        return 2*(width + height)
    }
}
let rect: RectAngle = RectAngle(width: 3.0, height: 4.0)
print(rect.computeArea())
print(rect.computePerimeter())

//协议继承
protocol TriangeleProtocol: AreaComputetionProtocol, PerimeterComputetionProtocol {
    var a: Double {get set}
    var b: Double {get set}
    var c: Double {get set}
    var base: Double {get set}
    var height: Double {get set}
}
struct Triangle: TriangeleProtocol {
    var a: Double = 0.0
    var b: Double = 0.0
    var c: Double = 0.0
    var base: Double = 0.0
    var height: Double = 0.0
    func computeArea() -> Double {
        return base*height/2.0
    }
    func computePerimeter() -> Double {
        return a + b + c
    }
}
let triangle: Triangle = Triangle(a: 3, b: 4, c: 5, base: 3, height: 4)
print(triangle.computeArea())
print(triangle.computePerimeter())

//委托：让一个类或结构能够将工作和决策交给另一个类或结构去完成
/// 售货机协议
protocol VendingMathineProtocol {
    /// 是否投币
    var coinInserted: Bool {get set}
    
    /// 能否售货
    func shouldVend() -> Bool
}

/// 自动售货机类，遵守售货机协议
class Vendor: VendingMathineProtocol {
    var coinInserted: Bool = false
    
    /// 如果投币则售货否则不售货
    ///
    /// - Returns: 是否售货
    func shouldVend() -> Bool {
        if coinInserted {
            coinInserted = false
            return true
        }
        else
        {
            return false
        }
    }
}

/// 可乐机类
class ColaMethine {
    // 自动售货机类，遵守售货机协议
    var vendor: VendingMathineProtocol
    init(vendor: VendingMathineProtocol) {
        self.vendor = vendor
    }
    
    /// 投币
    func insertCoin() {
        vendor.coinInserted = true
    }
    
    /// 销售可乐按钮事件
    func pressColaButton() -> String {
        if vendor.shouldVend() {
            return "Here's a cola!"
        }
        else
        {
            return "You must insert coin!"
        }
    }
    /// 销售啤酒按钮事件
    func pressRootBeerButton() -> String {
        if vendor.shouldVend() {
            return "Here's a Root Beer!"
        }
        else
        {
            return "You must insert coin!"
        }
    }
}
let methine: ColaMethine = ColaMethine.init(vendor: Vendor.init())
print(methine.pressColaButton())
methine.insertCoin()
print(methine.pressColaButton())
methine.insertCoin()
print(methine.pressRootBeerButton())
print(methine.pressColaButton())

//扩展：不继承而扩展类的功能，扩展能够以非侵入式的方式，增加类、结构、甚至基本类型的行为和功能，类似于Objective_C的类别，但是强大得多

// MARK: - 可乐机的扩展
extension ColaMethine {
    /// 健怡可乐按钮事件
    func pressDietColaButton() -> String {
        if vendor.shouldVend() {
            return "Here's a Diet Cola!"
        }
        else
        {
            return "You must insert coin!"
        }
    }
}
methine.insertCoin()
print(methine.pressDietColaButton())

/* 
 扩展基本数据类型
 不能在扩展中添加常规存储属性，但可以添加计算属性：值是通过计算获得的属性
*/
let limit: Double = 1024.0
// MARK: - 为Int64扩展属性，获取存储单位的换算结果
extension Int64 {
    var K: String {return String.init(format: "%fK", Double(self)/limit)}
    var M: String {return String.init(format: "%fM", Double(self)/limit/limit)}
    var G: String {return String.init(format: "%fG", Double(self)/limit/limit/limit)}
    var T: String {return String.init(format: "%fT", Double(self)/limit/limit/limit/limit)}
}
let bytes: Int64 = 2345346457
print(bytes.K)
print(bytes.M)
print(bytes.G)
print(bytes.T)
// MARK: - 为String类型扩展方法
extension String {
    func prependString(value: String) -> String {
        return self + value
    }
    func appendString(value: String) -> String {
        return value + self
    }
}
print("x".prependString(value: "y"))
print("x".appendString(value: "y"))

//mutating关键字：如果要修改自身的值而不是返回计算的结果，那么就得使用mutating关键字
// MARK: - 为Double数据类型扩展方法
extension Double {
    /// 平方值
    mutating func squra() {
        self = self*self
    }
    
    /// 立方值
    mutating func cube() {
        self = self*self*self
    }
}
var num: Double = 1.5
num.squra()
print(num)
num.cube()
print(num)

//在扩展中使用闭包
extension Int {
    func intRepeat(work: () ->()) {
        //这里的"_"表示忽略循环变量
        for _ in 0..<self {
            work()
        }
    }
}
let intNum: Int = 10
5.intRepeat {
    print(intNum)
}

