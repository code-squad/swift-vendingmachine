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
        self.vendingMachine = VendingMachine()
    }
    
    func testVendingMachineInstantiate() {
        let vendingMachine: VendingMachine = VendingMachine()
        XCTAssertNotNil(vendingMachine)
    }
    
    func testIsInsertedMoneyZero() {
        let vendingMachine = VendingMachine()
        let insertedMoney = vendingMachine.insertedMoney
        XCTAssertEqual(0, insertedMoney)
    }
    
    func testInsertMoneyToVendingMachine() {
        let money: Int = 1000
        self.vendingMachine.insertMoney(money)
        XCTAssertEqual(1000, self.vendingMachine.insertedMoney)
    }
    
    func testAddBeverageStockToMachine() {
        let topCoffee: TOP = TOP(brand: "티오피", capacity: 300, price: 1000, name: "티오피커피", manufacturedDate: "20180609", caffeineContent: 50, canColor: .black)
        self.vendingMachine.addBeverageStock(topCoffee)
        XCTAssertNotNil(self.vendingMachine.beverageStock)
    }
    
    func testAddBeverageStockToMachine_stockCount() {
        let topCoffee: TOP = TOP(brand: "티오피", capacity: 300, price: 1000, name: "티오피커피", manufacturedDate: "20180609", caffeineContent: 50, canColor: .black)
        self.vendingMachine.addBeverageStock(topCoffee)
        XCTAssertEqual(vendingMachine.beverageStock.count, 1)
    }
    
    func testAddBeverageStockToMachine_withChocoMilk() {
        let chocoMilk: ChocoMilk = ChocoMilk(brand: "서울우유", capacity: 350, price: 1300, name: "초코우유", manufacturedDate: "20180609", hasCacao: false)
        self.vendingMachine.addBeverageStock(chocoMilk)
        XCTAssertEqual(self.vendingMachine.beverageStock.count, 1)
    }
    
    func testAddMultipleBeverageStocksToMachine() {
        let chocoMilk: ChocoMilk = ChocoMilk(brand: "서울우유", capacity: 350, price: 1300, name: "초코우유", manufacturedDate: "20180609", hasCacao: false)
        let topCoffee: TOP = TOP(brand: "티오피", capacity: 300, price: 1000, name: "티오피커피", manufacturedDate: "20180609", caffeineContent: 50, canColor: .black)
        self.vendingMachine.addBeverageStock(chocoMilk)
        self.vendingMachine.addBeverageStock(topCoffee)
        XCTAssertEqual(self.vendingMachine.beverageStock.count, 2)
    }
}
