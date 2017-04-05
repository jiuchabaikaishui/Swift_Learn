//
//  Portal.swift
//  SwiftFirst
//
//  Created by 綦 on 17/4/5.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation
class Portal : NSObject {
    var opened : Bool = false
    var locked : Bool = true
    let width : Float
    let height : Float
    let weight : Float
    var color : String = "Red"
    
    init(width: Float = 32, height: Float = 72, weight: Float = 18) {
        self.width = width
        self.height = height
        self.weight = weight
    }
    
    func open() {
        if locked {
            locked = false
        }
        opened = true
        
        print("\(type(of: self)) opened!")
    }
    
    func close() {
        if !locked {
            locked = true
        }
        opened = false
        
        print("\(type(of: self)) closed!")
    }
    
    func lock() {
        if opened {
            opened = false
        }
        locked = true
        
        print("\(type(of: self)) locked!")
    }
    
    func unlock() {
        if opened {
            opened = false
        }
        locked = false
        
        print("\(type(of: self)) unlocked!")
    }
}
