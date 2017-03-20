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
        let i = 10
        
        switch i {
        case i...3:
            print("小")
        default:
            print("大")
        }
    }

    weak var pointButton:UIButton!
}

