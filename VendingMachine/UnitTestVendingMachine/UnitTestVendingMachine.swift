//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        vendingMachine = VendingMachine()
        vendingMachine.inventory()
    }
    
    /// 동작
    // 돈 넣기
    func testIncreaseBalance() {
        vendingMachine.insert(money: "1 1000")
        XCTAssertEqual(vendingMachine.balance(),1000)
    }
    
    // 돈 더 넣기
    func testAddBalance() {
        vendingMachine.insert(money: "1 1000")
        vendingMachine.insert(money: "1 1000")
        XCTAssertEqual(vendingMachine.balance(),2000)
    }
    
    // 음료 하나 구매 후 재고 하나 줄이기
    func testDecreaseBeverageCount() {
        vendingMachine.insert(money: "1 1000")
        vendingMachine.sell(beverage: "2 2")
        XCTAssertEqual(vendingMachine.currentBeverageStatus()[1]!.2,9)
    }
    
    // 돈 넣고 음료 구매 후 잔액 차감하기
    func testDecreaseBalacne() {
        vendingMachine.insert(money: "1 1000")
        vendingMachine.sell(beverage: "2 2")
        XCTAssertEqual(vendingMachine.balance(),0)
    }
    
    /// 에러
    // 메뉴 입력 확인
    func testIncorrectNotError() {
        let error = incorrect("1 1000")
        XCTAssertEqual(error, .notError)
    }
    
    func testIncorrectError() {
        let error = incorrect("3 1000")
        XCTAssertEqual(error, .incorrect)
    }
    
    // 현재 잔액으로 음료 구매
    func testEnoughBalanceError() {
        vendingMachine.insert(money: "1 10000")
        let error = notEnoughBalance(of: vendingMachine, "2 2")
        XCTAssertEqual(error, .notError)
    }
    
    func testNotEnoughBalanceError() {
        //vendingMachine.insert(money: "1 100")
        // 잔액 = 0
        let error = notEnoughBalance(of: vendingMachine, "2 2")
        XCTAssertEqual(error, .notEnoughBalance)
    }
    
    // 음료의 재고 확인
    func testCanBuy() {
        let error = outOfStock(machine: vendingMachine, "2 2")
        XCTAssertEqual(error, .notError)
    }
    
    func testCannotBuy() {
        vendingMachine.insert(money: "1 10000")
        for _ in 0 ... 9 {
            vendingMachine.sell(beverage: "2 2")
        }
        let error = outOfStock(machine: vendingMachine, "2 2")
        XCTAssertEqual(error, .outOfStock)
    }
}
