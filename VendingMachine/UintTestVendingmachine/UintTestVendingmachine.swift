//
//  UintTestVendingmachine.swift
//  UintTestVendingmachine
//
//  Created by Yoda Codd on 2018. 7. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UintTestVendingmachine: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let drink1 = ChocoMilk(barnd: "Mail", size: 200, price: 1000, name: "초코초코", manufacturingDate: "20181023")
        if drink1!.description == "Mail, 200ml, 1000원, 초코초코, 20181023" {
            XCTAssert(true)
        }
        else {
            XCTAssert(false)
        }
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
