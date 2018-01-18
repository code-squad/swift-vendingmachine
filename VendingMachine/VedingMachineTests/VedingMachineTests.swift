//
//  VedingMachineTests.swift
//  VedingMachineTests
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class VedingMachineTests: XCTestCase {
    let today = DateUtility.today()
    
    func test_바나나_우유_인스턴스_생성() {
        let bananaMilk = BeverageMenu.bananaMilk.makeInstance()
        XCTAssertFalse(bananaMilk.isLowCalorie())
    }
    
    func test_동전_삽입() {
        let money = Money()
        let inventory = Inventory()
        let vendingMachine = VendingMachine(money: money, inventory: inventory)
        vendingMachine.insertMoney(coin: .fiveHundred)
        vendingMachine.insertMoney(coin: .fiveThousand)
        XCTAssertTrue(vendingMachine.countChange() == 5500)
    }
    
    func test_재고_추가() {
        let money = Money()
        let inventory = Inventory()
        let vendingMachine = VendingMachine(money: money, inventory: inventory)
        vendingMachine.insertBeverage(beverageMenu: .bananaMilk, quantity: 5)
        XCTAssertTrue(vendingMachine.countBeverageQuantity(beverageMenu: .bananaMilk) == 5)
    }
    
    func test_구매할수_있는_목록_확인_성공() {
        var money = Money()
        money.insert(coin: .thousand)
        money.insert(coin: .fiveHundred)
        var inventory = Inventory()
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        let result = VendingMachine(money: money, inventory: inventory).fetchPurchasableBeverages()
        XCTAssertTrue(result.count == 2)
        XCTAssertTrue(result.filter({ $0.beverageMenu == BeverageMenu.bananaMilk }).count == 1)
        XCTAssertTrue(result.filter({ $0.beverageMenu == BeverageMenu.cocaCola }).count == 1)
    }
    
    func test_구매할수_없는_목록_확인_실패() {
        var money = Money()
        money.insert(coin: .thousand)
        var inventory = Inventory()
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        let result = VendingMachine(money: money, inventory: inventory).fetchPurchasableBeverages()
        XCTAssertTrue(result.count == 0)
    }
    
    func test_음료_구매() throws {
        var money = Money()
        money.insert(coin: .thousand)
        money.insert(coin: .fiveHundred)
        var inventory = Inventory()
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .cocaCola)
        inventory.insertBeverage(beverageMenu: .bananaMilk)
        var vendingMachine = VendingMachine(money: money, inventory: inventory)
        try vendingMachine.buyBeverage(beverageMenu: .cocaCola)
        XCTAssertTrue(vendingMachine.countChange() == 70)
        XCTAssertTrue(vendingMachine.countBeverageQuantity(beverageMenu: .cocaCola) == 1)
    }
    
    func test_뜨거운_음료_목록_확인() {
        let money = Money()
        let inventory = Inventory()
        let vendingMachine = VendingMachine(money: money, inventory: inventory)
        XCTAssertTrue(vendingMachine.fetchListOfHottedBeverage().count == 1)
    }
    
    func test_기간이_유효한_목록_확인() {
        let money = Money()
        let inventory = Inventory()
        let vendingMachine = VendingMachine(money: money, inventory: inventory)
        let result = vendingMachine.fetchListOfValidDate()
        XCTAssertTrue(result.count == 4)
    }
    
}
