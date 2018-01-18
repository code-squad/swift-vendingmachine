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
        XCTAssertTrue(inventory.countQuantity(beverageMenu: .bananaMilk) == 2)
        XCTAssertTrue(inventory.countQuantity(beverageMenu: .cocaCola) == 1)
    }
    
    func test_바나나우유_코카콜라_재고_삭제() {
        var inventory = Inventory()
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        inventory.deductBeverage(beverageMenu: .bananaMilk)
        inventory.deductBeverage(beverageMenu: .cocaCola)
        inventory.deductBeverage(beverageMenu: .bananaMilk)
        XCTAssertTrue(inventory.countQuantity(beverageMenu: .bananaMilk) == 0)
        XCTAssertTrue(inventory.countQuantity(beverageMenu: .cocaCola) == 1)
    }

}
