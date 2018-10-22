//
//  VendingMachineUnitTests.swift
//  VendingMachineUnitTests
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class VendingMachineUnitTests: XCTestCase {
    private let beverages: [Beverage] = Beverage.sample
    private var stocks: Stocks!
    private var machine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        self.stocks = Stocks(beverages)
        self.machine = VendingMachine(stocks)
    }
    
    func testBeveragesInAccount() {
        giveAccount(money: 2000)
        let result = giveAvailableBeveragesInAccount()
        result.forEach {
            XCTAssertNotNil($0.isPurchasable(with: 2000), "해당 금액으론 살 수 없는 음료가 포함되어 있습니다.")
        }
    }
    
    func testBuyBeverage() {
        giveAccount(money: 10000)
        let before = giveAvailableBeveragesInStocks()
        do {
            let item = try machine.buy(at: 1)
            let after = giveAvailableBeveragesInStocks()
            XCTAssertTrue(before.contains(where: {$0.beverage.isEqual(item)}), "구매한 음료가 일치하지 않습니다.")
            XCTAssertFalse(after.contains(where: {$0.beverage.isEqual(item)}), "구매한 음료가 여전히 재고에 존재합니다.")
            XCTAssertTrue(machine.history.hasHistory(of: item), "구매한 음료가 구매 내역에 존재하지 않습니다.")
        }catch let err {
            XCTFail("\((err as! VendingMachineError))")
        }
    }
    
    private func giveAccount(money: Int) {
        machine.remain = money
    }
    
    private func giveAvailableBeveragesInAccount() -> [Beverage] {
        return machine.availables(with: machine.remain)
    }
    
    private func giveAvailableBeveragesInStocks() -> [(beverage: Beverage, count: Int)] {
        return machine.availables
    }
    
    func testExpiredBeverage() {
        let riceWine = RiceWine(area: .busan, alcohol: 0.3, brand: "부산막걸리", volume: 450, price: 4000, name: "생탁", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 3)))
        XCTAssertFalse(riceWine.isValidate())
    }
    
    func testNotExpiredRiceWine() {
        let riceWine = RiceWine(area: .busan, alcohol: 0.3, brand: "부산막걸리", volume: 450, price: 4000, name: "생탁", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 3)))
        XCTAssertFalse(riceWine.isValidate(at: Date(timeIntervalSinceNow: -Date.convert(weeks: 2))))
    }
    
    func testLowFatMilk() {
        let milk = Milk(fat: 0.1, code: "강릉-5-24", brand: "서울우유", volume: 300, price: 2000, name: "저지방 우유", date: Date(timeIntervalSinceNow: -Date.convert(days: 5)))
        XCTAssertTrue(milk.isLowFat)
    }
    
    func testNotLowFatMilk() {
        let milk = Milk(fat: 0.3, code: "강릉-5-24", brand: "서울우유", volume: 300, price: 2000, name: "흰 우유", date: Date(timeIntervalSinceNow: -Date.convert(days: 5)))
        XCTAssertFalse(milk.isLowFat)
    }
}
