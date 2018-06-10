//
//  VendingMachineUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest
@testable import VendingMachine

class VendingMachineUnitTest: XCTestCase {
    
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        
        self.vendingMachine = VendingMachine()
    }
    
    func testInsertMoney() {
        let money: Int = 1000
        vendingMachine.insertMoney(money)
        let expected: Int = 1000
        XCTAssertEqual(vendingMachine.balance, expected)
    }
}
