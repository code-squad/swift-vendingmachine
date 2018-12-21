//
//  UnitTestManagerMode.swift
//  VendingMachineUnitTest
//
//  Created by 윤지영 on 20/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestManagerMode: XCTestCase {
    private var vendingMachine: VendingMachine!

    override func setUp() {
        super.setUp()
        let emptyInventory = Inventory(list: [:])
        self.vendingMachine = VendingMachine(initialInventory: emptyInventory)
    }

    func testAddBeverage_whenNumberIsInList() {
        let numberInList = 3
        XCTAssertTrue(vendingMachine.add(beverage: numberInList))
    }

    func testCannotAddBeverage_whenNumberIsOutOfList() {
        let numberOutOfList = 7
        XCTAssertFalse(vendingMachine.add(beverage: numberOutOfList))
    }

    func testRemoveBeverage_whenBeverageOfTheNumberExist() {
        let number = 3
        _ = vendingMachine.add(beverage: number)
        XCTAssertNotNil(vendingMachine.remove(beverage: number))
    }

    func testCannotRemoveBeverage_whenBeverageOfTheNumberNotExist() {
        let numberAdded = 3
        let numberNotAdded = 4
        _ = vendingMachine.add(beverage: numberAdded)
        XCTAssertNil(vendingMachine.remove(beverage: numberNotAdded))
    }

    func testRemoveExpiredBeverages() {
        let strawberryMilkExpired = StrawberryMilk(daysBefore: 15)
        let chocolateMilkExpired = ChocolateMilk(daysBefore: 20)
        let expired = [strawberryMilkExpired, chocolateMilkExpired]
        vendingMachine.add(beverage: strawberryMilkExpired)
        vendingMachine.add(beverage: chocolateMilkExpired)
        XCTAssertEqual(expired, vendingMachine.removeExpiredBeverages())
    }

    func testHistoryIsEmpty_whenNoPurchaseOccurred() {
        XCTAssertFalse(vendingMachine.hasHistory())
    }

    func testHisoryIsNotEmpty_whenPurchaseOccurred() {
        _ = vendingMachine.add(beverage: 0)
        let list = vendingMachine.getListBuyable()
        guard let pack = list.first else { return }
        _ = vendingMachine.buy(beverage: pack)
        XCTAssertTrue(vendingMachine.hasHistory())
    }

    func testHistoryOfBeveragesPurchasedIsUpdatedToTheHistoryWell() {
        let pepsi = Pepsi(), pepsiTwo = Pepsi(), sprite = Sprite(), chocolateMilk = ChocolateMilk()
        let cantata = Cantata(), georgia = Georgia(), strawberryMilk = StrawberryMilk()
        let beverages = [pepsi, pepsiTwo, sprite, chocolateMilk, cantata, georgia, strawberryMilk]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}

        let enoughMoney = 100000
        _ = vendingMachine.insert(money: enoughMoney)

        var purhcases: [Beverage] = []
        while vendingMachine.isEmpty() {
            guard let item = vendingMachine.getListBuyable().first else { continue }
            guard let beveragePurchased = vendingMachine.buy(beverage: item) else { continue }
            purhcases.append(beveragePurchased)
        }
        let historyExpected = History(purchases: purhcases)
        XCTAssertTrue(vendingMachine.hasEqualHistory(with: historyExpected))
    }

}
