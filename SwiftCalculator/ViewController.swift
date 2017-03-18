//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by 綦 on 17/3/17.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var zeroButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var x = 12
        let y = 42.0
        x = Int(y);
        print(x)
        
        var t = 123
        t += 1
        var s = String(t)
        s = s.appendingFormat("3")
        
        print(Int(s))
        print(Double(s))
        print(Float(s))
        
        let name : String = "綦帅鹏"
        let age : Int = 10
        print("My name is " + name + "," + String(age) + " years old!")
        print("My name is \(name), \(age) years old!")
        
        //起别名
        typealias MyInt = Int
        let num : MyInt = 10
        print(num)
        
        //元组
        let student = ("綦帅鹏", 27, "打球")
        print("学生：\(student.0), \(student.1)岁，喜欢\(student.2)！")
        
        //数组，数组中数据的类型必须相同
        var studentsName = ["张三", "李四", "王五"]
        studentsName.append("赵六")
        print(studentsName)
        
        studentsName += ["綦帅鹏", "綦朝晖"]
        print(studentsName)
        
        studentsName[0] = "廖雨琦"
        print(studentsName)
        
        studentsName.remove(at: 1)
        print(studentsName)
    }

    weak var pointButton:UIButton!
}

