//
//  PasswordDoor.swift
//  SwiftFirst
//
//  Created by 綦 on 17/4/5.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation
class PasswordDoor : Door {
    var password : NSString = "0000"
    
    override func lock() {
        print("please use password lock the 'PasswordDoor'!")
    }
    override func unlock() {
        print("please use password lock the 'PasswordDoor'!")
    }
    func lock(password: NSString = "0000") {
        if password.isEqual(to: String(self.password)) {
            super.lock()
        }
        else
        {
            print("The password you entered is incorrect!")
        }
    }
    func unlock(password: NSString) {
        if password.isEqual(to: String(self.password)) {
            super.unlock()
        }
        else
        {
            print("The password you entered is incorrect!")
        }
    }
}
