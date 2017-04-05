//
//  main.swift
//  Function
//
//  Created by 綦 on 17/3/20.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation

//
func add(num: Int, otherNum: Int) -> Int {
    return num + otherNum
}
print(add(num: 10, otherNum: 20))

//可变参数，只能在函数的最后一个参数中用...来添加多个参数
func addAllNums(nums: Float...) -> Float {
    var result : Float = 0.0
    for item in nums {
        result += item;
    }
    
    return result
}
print(addAllNums(nums: 10, 20, 30, 40, 50, 60, 70, 80, 90, 100))

//找出最大数
func findMax(nums: Double...) -> Double {
    var result : Double = -Double.infinity//负无穷大
    for item in nums {
        if item > result {
            result = item
        }
    }
    
    return result
}
print(findMax(nums: 12, 3333, 32413, 324, 34124, 3432))
//找出最小数
func findMin(nums: Double...) -> Double {
    var result : Double = Double.infinity
    for item in nums {
        if item < result {
            result = item
        }
    }
    
    return result
}
print(findMin(nums: 12, 3333, 32413, 324, 34124, 3432))

//函数返回函数
func findNum(type: String) -> (Double...) -> (Double) {
    if type == "max" || type == "Max" {
        return findMax
    }
    return findMin
}
print(findNum(type: "Max")(1,2,3,4,32,32,4,34,23) + findNum(type: "Min")(2,32,323,233,1,323))

//函数嵌套
func randomNum(type:String) -> Int {
    func randomPositive() -> Int {
        return Int(arc4random())
    }
    func randomNegative() -> Int {
        return -(Int)(arc4random())
    }
    
    if type == "randomPositive" {
        return randomPositive()
    }
    
    return randomNegative()
}
print(randomNum(type: "randomPositive"))
print(randomNum(type: "randomNegative"))

//默认参数
func circleArea(r: Double = 10) -> Double{
    return M_PI*r*r
}
print(circleArea())
print(circleArea(r: 100))

//变量参数，inout关键字会改变函数体外的变量值
func ascendingSort(num1: inout Int, num2: inout Int, num3: inout Int) -> [Int]
{
    var temp : Int
    if num1 > num2 {
        temp = num1;
        num1 = num2;
        num2 = temp;
    }
    if num2 > num3 {
        temp = num2;
        num2 = num3;
        num3 = temp;
    }
    
    return [num1, num2, num3]
}
var num1 = 3
var num2 = 2
var num3 = 4
print(ascendingSort(num1: &num1, num2: &num2, num3: &num3))
print([num1, num2, num3])

//闭包
var simpleClosure = {(amount: Double, interestRate: inout Double, years: Int) -> Double in
    interestRate = interestRate/100
    var interest = Double(years) * interestRate * amount
    
    return interest + amount
}
//闭包做函数的参数
func loanCalculator(amount: Double, interestRate: inout Double, years: Int, calculator: (Double, inout Double, Int) -> Double) -> Double
{
    return calculator(amount, &interestRate, years)
}
var rate : Double = 3.875
print(loanCalculator(amount: 10000, interestRate: &rate, years: 5, calculator: simpleClosure))


		
