//
//  VendingMachineTest.swift
//  VendingMachineTest
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

// 자판기 동작 테스트.
class VendingMachineTest: XCTestCase {

    func testSupply_Single_Menu() {
        let machine = VendingMachine().sharedInstance
        machine.supply(beverageType: .bananaMilk, 5)
        XCTAssertNotEqual(machine.checkTheStock(), [VendingMachine.Menu.bananaMilk: 5])
    }

    func testSupply_Multiple_Menus() {
        let machine = VendingMachine().sharedInstance
        machine.supply(beverageType: .bananaMilk, 5)
        machine.supply(beverageType: .strawberryMilk, 5)
        XCTAssertNotEqual(machine.checkTheStock(), [VendingMachine.Menu.strawberryMilk: 5])
    }

    func testSupply_Multiple_Menus2() {
        let machine = VendingMachine().sharedInstance
        machine.supply(beverageType: .bananaMilk, 5)
        machine.supply(beverageType: .strawberryMilk, 5)
        machine.supply(beverageType: .fanta, 5)
        let expectResult = [
            VendingMachine.Menu.bananaMilk: 5,
            VendingMachine.Menu.strawberryMilk: 5,
            VendingMachine.Menu.fanta: 5
        ]
        XCTAssertNotEqual(machine.checkTheStock(), expectResult)
    }

    func testInsertMoney() {
        let machine = VendingMachine().sharedInstance
        machine.insertMoney(.oneThousand)
        XCTAssertEqual(machine.showBalance(), MoneyManager.Unit.oneThousand.rawValue)
    }

    func testPopBeverage_BananaMilk() {
        let machine = VendingMachine().sharedInstance
        machine.supply(beverageType: .bananaMilk, 5)
        machine.supply(beverageType: .strawberryMilk, 5)
        machine.supply(beverageType: .fanta, 5)
        machine.insertMoney(.oneThousand)
        let beverage = machine.popBeverage(.strawberryMilk)
        XCTAssertEqual(beverage?.description, "StrawBerryMilk")
    }

    func testCheckTheStock() {
        let machine = VendingMachine().sharedInstance
        machine.supply(beverageType: .bananaMilk, 5)
        machine.supply(beverageType: .strawberryMilk, 5)
        machine.supply(beverageType: .fanta, 5)
        machine.insertMoney(.oneThousand)
        // 자판기에 없는 음료는 뽑히면 안 됨.
        _ = machine.popBeverage(.georgia)
        // 정상적으로 뽑힐 음료.
        _ = machine.popBeverage(.strawberryMilk)
        // 돈을 1000원밖에 안 넣었으니 더 뽑히면 안됨
        _ = machine.popBeverage(.fanta)
        _ = machine.popBeverage(.fanta)
        let expectResult = [
            VendingMachine.Menu.bananaMilk: 5,
            VendingMachine.Menu.strawberryMilk: 4,
            VendingMachine.Menu.fanta: 5
        ]
        XCTAssertEqual(machine.checkTheStock(), expectResult)
    }

    func testShowBalance() {
        let machine = VendingMachine().sharedInstance
        machine.supply(beverageType: .bananaMilk, 5)
        machine.supply(beverageType: .strawberryMilk, 5)
        machine.supply(beverageType: .fanta, 5)
        machine.insertMoney(.oneThousand)
        _ = machine.popBeverage(.strawberryMilk)
        // 1000원만 넣었기 때문에 하나 더 뽑아도 동작하지 않음.
        _ = machine.popBeverage(.strawberryMilk)
        XCTAssertEqual(machine.showBalance(), 0)
    }

    func testShowExpiredBeverages() {
        let machine = VendingMachine().sharedInstance
        machine.supply(beverageType: .bananaMilk, 5)
        machine.supply(beverageType: .strawberryMilk, 5)
        machine.supply(beverageType: .fanta, 5)
        // 돈을 안 넣었기 때문에 뽑았다고 해서 개수가 줄어들면 안 됨.
        _ = machine.popBeverage(.strawberryMilk)
        let expiredList = machine.showExpiredBeverages(on: Date(timeIntervalSinceNow: 60*60*24*20))
        let expectResult = [
            VendingMachine.Menu.bananaMilk: 5,
            VendingMachine.Menu.strawberryMilk: 5
        ]
        // Date 비교 때문에 에러날 수 있음. 이 함수만 따로 테스트하기.
        XCTAssertEqual(expiredList, expectResult)
    }

    func testShowHotBeverages() {
        let machine = VendingMachine().sharedInstance
        let hotBeverageList = machine.showHotBeverages()
        XCTAssertEqual(hotBeverageList, [VendingMachine.Menu.top, VendingMachine.Menu.georgia])
    }

}
