//
//  main.swift
//  FlowControl
//
//  Created by 綦 on 17/3/20.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation

let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for num in arr {
    print(num)
}
for item in 1...10 {
    print(item)
}
for item in 1..<10 {
    print(item)
}
for item in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].reversed() {
    print(item)
}
if arr[2] > arr[3]
{
    print(arr[2])
}
else if arr[2] == arr[3]
{
    print("\(arr[2]), \(arr[3])")
}
else
{
    print(arr[3])
}
let lightColor = "red"
if lightColor == "red"
{
    print("Stop!")
}
else
{
    print("Go!")
}
let limit = 75
var speed = 0
while speed < 100 {
    speed += 1
    switch speed {
    case 0..<20:
        print("太慢啦！")
    case 20..<40:
        print("快点行吗！")
    case 40..<60:
        print("速度起来啦！")
    case 60...limit:
        print("别超速呀，我的哥！")
    default:
        print("超速啦，我的哥！")
    }
    if speed > limit {
        break
    }
}
