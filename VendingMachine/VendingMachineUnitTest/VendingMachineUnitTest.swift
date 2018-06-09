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
    
//    func testIsInsertedMoneyZero() {
//        let vendingMachine = VendingMachine()
//        let insertedMoney = vendingMachine.insertedMoney
//        XCTAssertEqual(0, insertedMoney)
//    }
    
//    func testInsertMoneyToVendingMachine() {
//        let money: Int = 1000
//        self.vendingMachine.insertMoney(money)
//        XCTAssertEqual(1000, self.vendingMachine.insertedMoney)
//    }
    
    func testAddBeverageStockToMachine_stockIsNotEmpty() {
        let topCoffee: TOP = TOP(brand: "티오피", capacity: 300, price: 1000, name: "티오피커피", manufacturedDate: "20180609", caffeineContent: 50, canColor: .black)
        self.vendingMachine.addBeverageStock(topCoffee)
        XCTAssertFalse(self.vendingMachine.isStockEmpty)
    }
    
    func testAddBeverageStockToMachine_withChocoMilk() {
        let chocoMilk: ChocoMilk = ChocoMilk(brand: "서울우유", capacity: 350, price: 1300, name: "초코우유", manufacturedDate: "20180609", hasCacao: false)
        self.vendingMachine.addBeverageStock(chocoMilk)
        XCTAssertFalse(self.vendingMachine.isStockEmpty)
    }
    
    func testAddMultipleBeverageStocksToMachine() {
        let chocoMilk: ChocoMilk = ChocoMilk(brand: "서울우유", capacity: 350, price: 1300, name: "초코우유", manufacturedDate: "20180609", hasCacao: false)
        let topCoffee: TOP = TOP(brand: "티오피", capacity: 300, price: 1000, name: "티오피커피", manufacturedDate: "20180609", caffeineContent: 50, canColor: .black)
        self.vendingMachine.addBeverageStock(chocoMilk)
        self.vendingMachine.addBeverageStock(topCoffee)
        XCTAssertFalse(self.vendingMachine.isStockEmpty)
    }
    
    func testBeverageStockIsEmpty_withNoAddition() {
        XCTAssertTrue(self.vendingMachine.isStockEmpty)
    }
    
    func testPurchasableBeverageList_getPurchableBeverageName() {
        let chocoMilk: ChocoMilk = ChocoMilk(brand: "서울우유", capacity: 350, price: 900, name: "초코우유", manufacturedDate: "20180609", hasCacao: false)
        self.vendingMachine.addBeverageStock(chocoMilk)
        XCTAssertEqual("초코우유", vendingMachine.purchasableBeveragesList())
    }
    
    func testVendingMachineShowPurchasableBeverageList() {
        let coke: Coke = Coke(brand: "코카콜라", capacity: 250, price: 1000, name: "제로콜라", manufacturedDate: "20180609", calories: 0, hasIce: true)
        let topCoffee: TOP = TOP(brand: "티오피", capacity: 300, price: 2000, name: "티오피커피", manufacturedDate: "20180609", caffeineContent: 50, canColor: .black)
        let chocoMilk: ChocoMilk = ChocoMilk(brand: "서울우유", capacity: 350, price: 900, name: "초코우유", manufacturedDate: "20180609", hasCacao: false)
        self.vendingMachine.addBeverageStock(coke)
        self.vendingMachine.addBeverageStock(topCoffee)
        self.vendingMachine.addBeverageStock(chocoMilk)
        XCTAssertEqual(self.vendingMachine.purchasableBeveragesList(), "코카콜라(1개) 초코우유(1개)")
    }
}
