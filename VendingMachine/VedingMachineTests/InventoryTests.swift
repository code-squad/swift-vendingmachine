//
//  StockManagerTests.swift
//  VedingMachineTests
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class InventoryTests: XCTestCase {
    func test_바나나우유_코카콜라_재고_추가() {
        var inventory = Inventory()
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        XCTAssertTrue(inventory.countBeverageQuantity(beverageMenu: .bananaMilk) == 2)
        XCTAssertTrue(inventory.countBeverageQuantity(beverageMenu: .cocaCola) == 1)
    }
    
    func test_바나나우유_코카콜라_재고_삭제() throws {
        var inventory = Inventory()
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        try inventory.deductBeverage(beverageMenu: .bananaMilk)
        try inventory.deductBeverage(beverageMenu: .cocaCola)
        try inventory.deductBeverage(beverageMenu: .bananaMilk)
        XCTAssertTrue(inventory.countBeverageQuantity(beverageMenu: .bananaMilk) == 0)
        XCTAssertTrue(inventory.countBeverageQuantity(beverageMenu: .cocaCola) == 1)
    }
    
    func test_재고_없을때_재고_뽑으면_에러_발생() throws {
        var inventory = Inventory()
        XCTAssertThrowsError(try inventory.deductBeverage(beverageMenu: .bananaMilk))
    }

}
