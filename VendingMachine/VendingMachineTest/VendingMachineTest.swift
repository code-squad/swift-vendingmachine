//
//  VendingMachineTest.swift
//  VendingMachineTest
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class VendingMachineTest: XCTestCase {
    let strawberryMilk = StrawberryMilk(stringDate: "20190630", strawberryContent: 20)
    let chocolateMilk = ChocolateMilk(fattyContent: 1.4)
    let coke = Coke(calorie: 200, sugarFree: false)
    let sprite = Sprite(calorie: 90, lemonContent: 3.5)
    let topCoffee = TOPCoffee(temperature: 70.0, arbicaBeansContent: true)
    let cantataCoffee = CantataCoffee(temperature: 30.0, DripStatus: true)
    
    var vendingMachine = VendingMachine()
    /// 자판기 금액을 원하는 금액만큼 올리는 메소드
    func testPay() {
        vendingMachine.pay(of: 10000)
        let balance = vendingMachine.checkBalance()
        
        XCTAssertTrue(balance == 10000)
    }
    
    /// 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func testStockUp() {
        vendingMachine.stockUp(of: strawberryMilk)
        let items = vendingMachine.isFullStock()
        
        XCTAssertTrue(items == ["딸기우유":1])
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func testDisplayItems() {
        vendingMachine.stockUp(of: strawberryMilk)
        vendingMachine.stockUp(of: chocolateMilk)
        vendingMachine.stockUp(of: coke)
        vendingMachine.stockUp(of: sprite)
        vendingMachine.stockUp(of: topCoffee)
        vendingMachine.stockUp(of: cantataCoffee)
        vendingMachine.pay(of: 3000)
        let items = vendingMachine.displayItems()
        
        XCTAssertTrue(items == [strawberryMilk, chocolateMilk, coke, sprite, cantataCoffee])
        
    }
    
    /// 음료수를 구매하는 메소드
    func testPurchase() {
        vendingMachine.pay(of: 10000)
        vendingMachine.stockUp(of: strawberryMilk)
        vendingMachine.stockUp(of: chocolateMilk)
        vendingMachine.stockUp(of: coke)
        vendingMachine.stockUp(of: sprite)
        vendingMachine.stockUp(of: topCoffee)
        vendingMachine.stockUp(of: cantataCoffee)
        vendingMachine.purchase(of: strawberryMilk)
        let balance = vendingMachine.checkBalance()
        
        XCTAssertTrue(balance == 7400)
    }
    
    /// 잔액을 확인하는 메소드
    func testCheckBalance() {
        var testVendingMachine = VendingMachine()
        let balance = testVendingMachine.checkBalance()
        
        XCTAssertTrue(balance == 0)
    }
    
    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func testIsFullStock(){
        vendingMachine.stockUp(of: strawberryMilk)
        let items = vendingMachine.isFullStock()
        
        XCTAssertTrue(items == ["딸기우유":1])
    }
    
    /// 유통기한이 지난 재고만 리턴하는 메소드
    func testIsItemsPastExpirationDate() {
        vendingMachine.stockUp(of: strawberryMilk)
        vendingMachine.stockUp(of: chocolateMilk)
        vendingMachine.stockUp(of: coke)
        vendingMachine.stockUp(of: sprite)
        vendingMachine.stockUp(of: topCoffee)
        vendingMachine.stockUp(of: cantataCoffee)
        let items = vendingMachine.isItemsPastExpirationDate()
        
        XCTAssertTrue(items == [strawberryMilk])
    }
    
    /// 따뜻한 음료만 리턴하는 메소드
    func testIsHotBeverage() {
        vendingMachine.stockUp(of: strawberryMilk)
        vendingMachine.stockUp(of: chocolateMilk)
        vendingMachine.stockUp(of: coke)
        vendingMachine.stockUp(of: sprite)
        vendingMachine.stockUp(of: topCoffee)
        vendingMachine.stockUp(of: cantataCoffee)
        let items = vendingMachine.isHotBeverage()
        
        XCTAssertTrue(items == [topCoffee])
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func testIsPurchaseDetails() {
        vendingMachine.stockUp(of: strawberryMilk)
        vendingMachine.stockUp(of: chocolateMilk)
        vendingMachine.stockUp(of: coke)
        vendingMachine.stockUp(of: sprite)
        vendingMachine.stockUp(of: topCoffee)
        vendingMachine.stockUp(of: cantataCoffee)
        vendingMachine.purchase(of: strawberryMilk)
        let items = vendingMachine.isPurchaseDetails()
        
        XCTAssertTrue(items == [strawberryMilk])
    }

}
