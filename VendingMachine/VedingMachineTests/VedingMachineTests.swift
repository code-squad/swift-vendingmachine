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
    
}
