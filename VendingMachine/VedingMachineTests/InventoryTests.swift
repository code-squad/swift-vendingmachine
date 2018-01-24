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
        var inventory = Inventory([])
        inventory = inventory.add(beverageMenu: .bananaMilk)
        inventory = inventory.add(beverageMenu: .cocaCola)
        inventory = inventory.add(beverageMenu: .bananaMilk)
        XCTAssertTrue(inventory.countBeverage(beverageMenu: .bananaMilk) == 2)
        XCTAssertTrue(inventory.countBeverage(beverageMenu: .cocaCola) == 1)
    }
    
    func test_바나나우유_코카콜라_재고_삭제() throws {
        var inventory = Inventory([])
        inventory = inventory.add(beverageMenu: .bananaMilk)
        inventory = inventory.add(beverageMenu: .cocaCola)
        inventory = inventory.add(beverageMenu: .cocaCola)
        inventory = inventory.add(beverageMenu: .bananaMilk)
        inventory = try inventory.deduct(beverageMenu: .bananaMilk)
        inventory = try inventory.deduct(beverageMenu: .cocaCola)
        inventory = try inventory.deduct(beverageMenu: .bananaMilk)
        XCTAssertTrue(inventory.countBeverage(beverageMenu: .bananaMilk) == 0)
        XCTAssertTrue(inventory.countBeverage(beverageMenu: .cocaCola) == 1)
    }
    
    func test_재고_없을때_재고_뽑으면_에러_발생() throws {
        let inventory = Inventory([])
        XCTAssertThrowsError(try inventory.deduct(beverageMenu: .bananaMilk))
    }
    
    func test_창고에_든_메뉴_수량_가져옴() {
        var inventory = Inventory([])
        inventory = inventory.add(beverageMenu: .bananaMilk)
        inventory = inventory.add(beverageMenu: .cocaCola)
        inventory = inventory.add(beverageMenu: .cocaCola)
        inventory = inventory.add(beverageMenu: .bananaMilk)
        inventory = inventory.add(beverageMenu: .bananaMilk)
        let beverageBoxes = inventory.fetchListOfBeverage()
        XCTAssertTrue(beverageBoxes.count == 6)
        XCTAssertTrue(beverageBoxes.filter({ $0.beverageMenu == BeverageMenu.bananaMilk }).count == 1)
        XCTAssertTrue(beverageBoxes.filter({ $0.beverageMenu == BeverageMenu.cocaCola }).count == 1)
        XCTAssertTrue(beverageBoxes.filter({ $0.quantity == 3 }).count == 1)
        XCTAssertTrue(beverageBoxes.filter({ $0.quantity == 2 }).count == 1)
    }

}
