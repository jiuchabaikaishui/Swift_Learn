//
//  main.swift
//  DataType
//
//  Created by 綦 on 17/3/20.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation

var x = 12
let y = 42.0
x = Int(y);
print(x)

var t = 123
t += 1
var s = String(t)
s = s.appendingFormat("3")

print(Int(s)!)
print(Double(s)!)
print(Float(s)!)

let name : String = "綦帅鹏"
let age : Int = 10
print("My name is " + name + "," + String(age) + " years old!")
print("My name is \(name), \(age) years old!")

//起别名：与typedef相似
typealias MyInt = Int
let num : MyInt = 10
print(num)

//元组
let student = ("綦帅鹏", 27, "打球")
print("学生：\(student.0), \(student.1)岁，喜欢\(student.2)！")

//数组，数组中数据的类型必须相同
var studentsName = ["张三", "李四", "王五"]
//添加数据
studentsName.append("赵六")
print(studentsName)
//添加多个数据，也可以理解为数组合并
studentsName += ["綦帅鹏", "綦朝晖"]
print(studentsName)
//添加数据到指定位置
studentsName.insert("廖腾逸", at: 0)
print(studentsName)
//修改数据
studentsName[1] = "廖雨琦"
print(studentsName)
//移除数据
studentsName.remove(at: 2)
print(studentsName)
//移除最后一个数据
studentsName.removeLast()
print(studentsName)
print(studentsName)
//移除所有数据
studentsName.removeAll()
print(studentsName)

//字典：不能将key指定为nil
var product = ["name":"iPhone5", "size":"4寸"]
print(product)
//取值
print(product["name"]!)
//添加数据
product["address"] = "香港"
print(product)
//修改数据
product["size"] = "4英寸"
print(product)
//删除数据
product["address"] = nil
print(product)

//字典数组搭配
print([[1, 2, 3], ["1", "2", "3"]])
print([["name": "张三", "address": "湖南"], ["name": "李四", "address": "北京"]])
//空数组
var arr: Array<Int> = []
arr.append(1)
print(arr)
var otherArr = [Int]()
otherArr += [2]
print(otherArr)
//空字典
var dic = Dictionary<String, String>()
dic["name"] = "张三"
print(dic)

//数组遍历
for item in [1, 2, 3] {
    print(item)
}
for (index, item) in [1, 2, 3].enumerated() {
    print("\(index): \(item)")
}
//遍历字典
for (key, value) in ["name": "张三", "address": "湖南"] {
    print("\(key):\(value)")
}

