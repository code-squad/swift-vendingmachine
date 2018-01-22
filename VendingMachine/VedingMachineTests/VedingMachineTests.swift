//
//  VedingMachineTests.swift
//  VedingMachineTests
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class VedingMachineTests: XCTestCase {
    func test_동전_추가_성공() throws {
        let vendingMachine = VendingMachine()
        try vendingMachine.insertMoney(coin: Money(100))
        try vendingMachine.insertMoney(coin: Money(200))
        try vendingMachine.insertMoney(coin: Money(10000))
        try vendingMachine.insertMoney(coin: Money(400))
        XCTAssertTrue(vendingMachine.countChange() == 10700)
    }
    
    func test_동전_추가_실패() throws {
        let vendingMachine = VendingMachine()
        XCTAssertThrowsError(try vendingMachine.insertMoney(coin: Money(-100)))
    }
    
    func test_동전_차감_성공() throws {
        let vendingMachine = VendingMachine()
        try vendingMachine.insertMoney(coin: Money(10000))
        try vendingMachine.deductMoney(coin: Money(9500))
        XCTAssertTrue(vendingMachine.countChange() == 500)
    }
    
    func test_동전_차감_실패() throws {
        let vendingMachine = VendingMachine()
        try vendingMachine.insertMoney(coin: Money(100))
        XCTAssertThrowsError(try vendingMachine.deductMoney(coin: Money(150)))
    }
    
    func test_재고_추가_성공() throws {
        let vendingMachine = VendingMachine()
        vendingMachine.insertBeverage(beverageMenu: .bananaMilk)
        vendingMachine.insertBeverage(beverageMenu: .cocaCola, quantity: 5)
        XCTAssertTrue(vendingMachine.countBeverageQuantity(beverageMenu: .bananaMilk) == 1)
        XCTAssertTrue(vendingMachine.countBeverageQuantity(beverageMenu: .cocaCola) == 5)
    }
    
    func test_재고_차감_성공() throws {
        let vendingMachine = VendingMachine()
        vendingMachine.supply(3)
        try vendingMachine.deductBeverage(beverageMenu: .bananaMilk)
        try vendingMachine.deductBeverage(beverageMenu: .cocaCola, quantity: 3)
        XCTAssertTrue(vendingMachine.countBeverageQuantity(beverageMenu: .bananaMilk) == 2)
        XCTAssertTrue(vendingMachine.countBeverageQuantity(beverageMenu: .cocaCola) == 0)
    }
    
    func test_재고_차감_실패() throws {
        let vendingMachine = VendingMachine()
        vendingMachine.supply(1)
        XCTAssertThrowsError(try vendingMachine.deductBeverage(beverageMenu: .cocaCola, quantity: 3))
    }

}
