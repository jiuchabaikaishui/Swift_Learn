//
//  Insterest.swift
//  SwiftFirst
//
//  Created by 綦 on 17/4/2.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Foundation

// MARK: - Double数据扩展，把Double数据转化成金额字符串
extension Double {
    var currency : String {
        let formatter : NumberFormatter = NumberFormatter()
        var result : String?
        formatter.numberStyle = NumberFormatter.Style.currency
        result = formatter.string(from: NSNumber.init(value: self))
        
        if result == nil {
            return "Format failure!"
        }
        
        return result!
    }
}

/// 利息计算
class Insterest: NSObject {
    /// 单利计算方法
    ///
    /// - Parameters:
    ///   - amount: 本金
    ///   - years: 年限
    ///   - rate: 年利息
    /// - Returns: 总金额
    func simpleCalculate(amount : Double, years: Int, rate: Double) -> Double {
        let interst : Double = amount*rate*Double(years)
        
        let doubleResult: Double = amount + interst
        
        return doubleResult
    }
    
    /// 复利计算方法
    ///
    /// - Parameters:
    ///   - amount: 本金
    ///   - years: 年限
    ///   - rate: 年利率
    /// - Returns: 总金额
    func compoundCalculate(amount: Double, years: Int, rate: Double) -> Double {
        let doubleResult: Double = amount * pow((1 + rate), Double(years))
        
        return doubleResult
    }

}
