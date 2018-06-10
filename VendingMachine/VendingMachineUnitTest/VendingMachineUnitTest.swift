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
    
    func testCheckBalance() {
        let expected: Int = 0
        XCTAssertEqual(vendingMachine.checkBalance(), expected)
    }
    
    func testInsertMoney() {
        let money: Int = 1000
        vendingMachine.insertMoney(money)
        let expected: Int = 1000
        XCTAssertEqual(vendingMachine.checkBalance(), expected)
    }
    
    func testBeverageStock() {
        let expected: BeverageStock = BeverageStock()
        XCTAssertEqual(vendingMachine.beverageStock, expected)
    }
    
    func testAddBeverage() {
        let coke: Coke = Coke(brand: "코카콜라", capacity: 200, price: 800, name: "제로콜라", manufacturedDate: "20180101", calories: 0, hasIce: false)
        var beverageList = BeverageList()
        beverageList.beverageList.append(coke)
        let expected = BeverageStock(beverageStock: [BeverageName.coke:beverageList])
        vendingMachine.add(beverage: coke)
        XCTAssertEqual(vendingMachine.beverageStock, expected)
    }
}
