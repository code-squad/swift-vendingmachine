//
//  VendingMachineUserTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 14..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class VendingMachineUserTest: XCTestCase {
    var vendingMachineMock: VendingMachineMock!

    override func setUp() {
        super.setUp()
        vendingMachineMock = VendingMachineMock.init()
    }

    override func tearDown() {
        vendingMachineMock = nil
        super.tearDown()
    }

    //    자판기 금액을 원하는 금액만큼 올리는 메소드
    func testInsertCoins() {
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(user.getBalance(), 5000)
        user.insertCoins(1000)
        XCTAssertEqual(user.getBalance(), 6000)
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func testGetBuyableProducts() {
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(user.getBuyableProducts().count, 6)
    }

    //    음료수를 구매하는 메소드
    func testBuy() {
        var user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        user.buy(category: "딸기우유")
        XCTAssertEqual(user.getInventory().count, 5)
        XCTAssertEqual(user.getBuyableProducts().count, 5)
        XCTAssertEqual(user.getBalance(), 4000)
    }

    //    잔액을 확인하는 메소드
    func testGetBalance() {
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(user.getBalance(), 5000)
        user.insertCoins(1000)
        XCTAssertEqual(user.getBalance(), 6000)
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func testGetInventory() {
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(user.getInventory().count, 6)
    }

    //    따뜻한 음료만 리턴하는 메소드
    func testGetHotProducts() {
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(user.getHotProducts().count, 2)
    }

    //    시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func testGetPurchaseList() {
        var user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(user.purchaseList.count, 0)
        user.buy(category: "칸타타커피")
        XCTAssertEqual(user.purchaseList.count, 1)
    }

}
