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
        let expected = BeverageStock(beverageStock: [BeverageName.Coke:beverageList])
        XCTAssertNoThrow(try vendingMachine.add(beverage: coke), "추가실패")
        XCTAssertEqual(vendingMachine.beverageStock, expected)
    }
    
    func testAddBeverage_addMultiBeverages() {
        let coke: Coke = Coke(brand: "코카콜라", capacity: 200, price: 800, name: "제로콜라", manufacturedDate: "20180101", calories: 0, hasIce: false)
        let sprite: Sprite = Sprite(brand: "코카콜라", capacity: 200, price: 800, name: "스프라이트", manufacturedDate: "20180505", calories: 70, hasOneMoreOnCap: false)
        var cokeBeverageList = BeverageList()
        var spriteBeverageList = BeverageList()
        cokeBeverageList.beverageList.append(coke)
        spriteBeverageList.beverageList.append(sprite)
        var expected = BeverageStock(beverageStock: [BeverageName.Coke:cokeBeverageList])
        expected.beverageStock[BeverageName.Sprite] = spriteBeverageList
        XCTAssertNoThrow(try vendingMachine.add(beverage: coke), "콜라 추가실패")
        XCTAssertNoThrow(try vendingMachine.add(beverage: sprite), "사이다 추가실패")
        XCTAssertEqual(vendingMachine.beverageStock, expected)
    }
    
    func testGetBuyableBeverageListWithBalance() throws {
        let cantata: Cantata = Cantata(brand: "칸타타", capacity: 350, price: 1000, name: "칸타타커피", manufacturedDate: "201806011", caffeineContent: 35, flavor: "아메리카노")
        let coke: Coke = Coke(brand: "코카콜라", capacity: 200, price: 800, name: "제로콜라", manufacturedDate: "20180101", calories: 0, hasIce: false)
        try vendingMachine.add(beverage: cantata)
        try vendingMachine.add(beverage: coke)
        vendingMachine.insertMoney(900)
        let expected = BeverageList(beverageList: [coke])
        XCTAssertEqual(vendingMachine.getBuyableBeverageList(), expected)
    }
}
