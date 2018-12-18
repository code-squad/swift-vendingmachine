//
//  UnitTestVendingMachine.swift
//  VendingMachineUnitTest
//
//  Created by 윤지영 on 18/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    private var vendingMachine: VendingMachine!
//예를 들어서, 재고 몇 개 추가하고 잔액 얼마 추가하면 어떤 상품 구매가능, 불가능인지 확인하고 가능한 상품 구매하고, 잔액 바뀌고 재고 상태 바뀌고, 구매 상품 이력을 확인한다.
    override func setUp() {
        super.setUp()
        let emptyInventory = Inventory(list: [:])
        self.vendingMachine = VendingMachine(initialInventory: emptyInventory)
    }

    func testNothingInVendingMachine_whenAnyBeverageDidNotBeAdded() {
        XCTAssertTrue(vendingMachine.isEmpty())
    }

    func testCannotInsertNegativeNumberAsMoney() {
        let minusCash = -500
        XCTAssertFalse(vendingMachine.insert(money: minusCash))
    }

    func testCannotInsertNoMoney() {
        let noCash = 0
        XCTAssertFalse(vendingMachine.insert(money: noCash))
    }

    func testCannotBuyAnything_whenTheBalanceIsZero_ThoughVendingMachineHaveBeverages() {
        let beverages = [Pepsi(), Sprite(), Cantata()]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}
        XCTAssertTrue(vendingMachine.getListBuyable().isEmpty)
    }

    func testBeverageAddedToVendingMachine_isInTheListBuyable_whenTheBalanceIsEnough() {
        let georgia = Georgia()
        vendingMachine.add(beverage: georgia)
        _ = vendingMachine.insert(money: 2500)
        XCTAssertNotNil(vendingMachine.getListBuyable().first)
    }

    func testBeverageAddedToVendingMachine_isInTheListBuyable_whenTheBalanceIsNotEnough() {
        let georgia = Georgia()
        vendingMachine.add(beverage: georgia)
        _ = vendingMachine.insert(money: 2400)
        XCTAssertNil(vendingMachine.getListBuyable().first)
    }

    func testBeveragePurchasedNotNil() {
        let strawberryMilk = StrawberryMilk()
        vendingMachine.add(beverage: strawberryMilk)
        _ = vendingMachine.insert(money: 3000)
        let list = vendingMachine.getListBuyable()
        XCTAssertNotNil(vendingMachine.buy(beverage: list.first!))
    }

    func testCannotBuyBeveragesMoreExpensiveThanBalane() {
        let pepsiBuyable = Pepsi(), spriteBuyable = Sprite(), chocolateMilkBuyale = ChocolateMilk()
        let cantataNotBuyable = Cantata(), georgiaNotBuyable = Georgia(), strawberryMilkNotBuyable = StrawberryMilk()
        let beverages = [pepsiBuyable, spriteBuyable, chocolateMilkBuyale,
                         cantataNotBuyable, georgiaNotBuyable, strawberryMilkNotBuyable]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}

        _ = vendingMachine.insert(money: 1800)
        let listBuyable = vendingMachine.getListBuyable()
        let beveragePurchased = vendingMachine.buy(beverage: listBuyable.randomElement()!)
        let beveragesNotBuyable: [Beverage] = [cantataNotBuyable, georgiaNotBuyable, strawberryMilkNotBuyable]
        XCTAssertFalse(beveragesNotBuyable.contains(beveragePurchased!))
    }

    func testBuyBeveragesEqualOrLessThanBalane() {
        let pepsiBuyable = Pepsi(), spriteBuyable = Sprite(), chocolateMilkBuyable = ChocolateMilk()
        let cantataNotBuyable = Cantata(), georgiaNotBuyable = Georgia(), strawberryMilkNotBuyable = StrawberryMilk()
        let beverages = [pepsiBuyable, spriteBuyable, chocolateMilkBuyable,
                         cantataNotBuyable, georgiaNotBuyable, strawberryMilkNotBuyable]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}

        _ = vendingMachine.insert(money: 1800)
        let listBuyable = vendingMachine.getListBuyable()
        let beveragePurchased = vendingMachine.buy(beverage: listBuyable.randomElement()!)
        let beveragesBuyable: [Beverage] = [pepsiBuyable, spriteBuyable, chocolateMilkBuyable]
        XCTAssertTrue(beveragesBuyable.contains(beveragePurchased!))
    }

    func testBalanceSubtraction_whenVendingMachineHasInventory_ButCannotBuyCuzBalanceIsSubtracted() {
        let pepsi = Pepsi(), georgia = Georgia()
        vendingMachine.add(beverage: pepsi)
        vendingMachine.add(beverage: georgia)
        _ = vendingMachine.insert(money: 1800)
        let listBuyable = vendingMachine.getListBuyable()
        _ = vendingMachine.buy(beverage: listBuyable.first!)
        XCTAssertTrue(vendingMachine.getListBuyable().isEmpty)
    }

    func testHistoryOfBeveragesPurchasedIsUpdatedToTheHistoryWell() {
        let pepsi = Pepsi(), pepsiTwo = Pepsi(), sprite = Sprite(), chocolateMilk = ChocolateMilk()
        let cantata = Cantata(), georgia = Georgia(), strawberryMilk = StrawberryMilk()
        let beverages = [pepsi, pepsiTwo, sprite, chocolateMilk, cantata, georgia, strawberryMilk]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}

        let enoughMoney = 100000
        _ = vendingMachine.insert(money: enoughMoney)

        var purhcases: [Beverage] = []
        while(vendingMachine.isEmpty()) {
            guard let item = vendingMachine.getListBuyable().first else { continue }
            guard let beveragePurchased = vendingMachine.buy(beverage: item) else { continue }
            purhcases.append(beveragePurchased)
        }
        let historyExpected = History(purchases: purhcases)
        XCTAssertTrue(vendingMachine.hasEqualHistory(with: historyExpected))
    }

}
