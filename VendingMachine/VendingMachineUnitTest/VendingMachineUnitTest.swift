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
    
    func testVendingMachineInstantiate() {
        let vendingMachine: VendingMachine = VendingMachine()
        XCTAssertNotNil(vendingMachine)
    }
    
    func testReadBalance() {
        XCTAssertEqual(vendingMachine.readBalance(), "0원")
    }
    
    func testInsertMoney() {
        vendingMachine.insertMoney(1000)
        let balance = vendingMachine.readBalance()
        XCTAssertEqual(balance, "1000원")
    }
}
