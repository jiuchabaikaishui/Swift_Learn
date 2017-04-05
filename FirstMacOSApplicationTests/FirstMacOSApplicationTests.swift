//
//  FirstMacOSApplicationTests.swift
//  FirstMacOSApplicationTests
//
//  Created by 綦 on 17/4/1.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import XCTest
@testable import FirstMacOSApplication

class FirstMacOSApplicationTests: XCTestCase {
    let insterest: Insterest = Insterest()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSimpleCalculate() {
        let result: Double = insterest.simpleCalculate(amount: 25000, years: 10, rate: 0.08)
        
        XCTAssertEqualWithAccuracy(result, 45000, accuracy: 0.01, "未通过测试：\(result)")
    }
    func testCompoundCalculate() {
        let result: Double = insterest.compoundCalculate(amount: 25000, years: 10, rate: 0.08)
        
        XCTAssertEqualWithAccuracy(result, 53973.12, accuracy: 0.01, "未通过测试：\(result)")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
