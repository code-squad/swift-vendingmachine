//
//  UnitTestMode.swift
//  VendingMachineUnitTest
//
//  Created by Elena on 02/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    private var vendingMachine: VendingMachine!

    override func setUp() {
        super.setUp()
        let emptyInventory = Inventory(list: [:])
        self.vendingMachine = VendingMachine(list: emptyInventory)
    }
    //자판기 비어있는지 확인
    func test_VendingMachine_isEmpty() {
        XCTAssertTrue(vendingMachine.isEmpty())
    }

    // 자판기에 음료를 사먹을수 있다는 테스트
    func test_Beverage_buyAvailable() {
        let coca = CocaCola()
        vendingMachine.add(beverage: coca)
        _ = vendingMachine.isPut(cash: 1800)
        XCTAssertNotNil(vendingMachine.buyAvailableList().first)
    }

    // 자판기에 음료를 사먹을수 없다는 테스트
    func test_Beverage_Not_buyAvailable() {
        let coca = CocaCola()
        vendingMachine.add(beverage: coca)
        _ = vendingMachine.isPut(cash: 500)
        XCTAssertNil(vendingMachine.buyAvailableList().first)
    }

    // 음료를 구매 할수 있는지 체크
    func test_Beverage_Purchased() {
        let banana = BananaMilk()
        vendingMachine.add(beverage: banana)
        _ = vendingMachine.isPut(cash: 2000)
        let list = vendingMachine.buyAvailableList()
        XCTAssertNotNil(vendingMachine.buyBeverage(package: list.first!))
    }

    // 음료 리스트가 있을때 음료를 추가하기
    func test_Beverage_List() {
        let goods = 3
        XCTAssertTrue(vendingMachine.add(beverage: goods))
    }

    // 음료 리스트가 없는 경우에 음료를 추가 한 경우
    func test_Beverage_No_List() {
        let goods = 10
        XCTAssertFalse(vendingMachine.add(beverage: goods))
    }

}
