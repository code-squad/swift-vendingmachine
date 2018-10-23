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
    
    //MARK:- Test Beverage
    func testExpiredBeverage() {
        let riceWine = RiceWine(area: .busan, alcohol: 0.3, brand: "부산막걸리", volume: 450, price: 4000, name: "생탁", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 3)))
        XCTAssertFalse(riceWine.isValidate())
    }
    
    func testLowFatMilk() {
        let milk = Milk(fat: 0.1, code: "강릉-5-24", brand: "서울우유", volume: 300, price: 2000, name: "저지방 우유", date: Date(timeIntervalSinceNow: -Date.convert(days: 5)))
        XCTAssertTrue(milk.isLowFat)
    }
    
    func testNotLowFatMilk() {
        let milk = Milk(fat: 0.3, code: "강릉-5-24", brand: "서울우유", volume: 300, price: 2000, name: "흰 우유", date: Date(timeIntervalSinceNow: -Date.convert(days: 5)))
        XCTAssertFalse(milk.isLowFat)
    }
    
    func testNotExpiredRiceWine() {
        let riceWine = RiceWine(area: .busan, alcohol: 0.3, brand: "부산막걸리", volume: 450, price: 4000, name: "생탁", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 3)))
        XCTAssertFalse(riceWine.isValidate(at: Date(timeIntervalSinceNow: -Date.convert(weeks: 2))))
    }
    
    //MARK:- Test with Budget
    //MARK: Success
    func testBeveragesInAccount() {
        giveAccount(money: 2000)
        let result = giveAvailableBeveragesInAccount()
        result.forEach {
            XCTAssertNotNil($0.isPurchasable(with: 2000), "해당 금액으론 살 수 없는 음료가 포함되어 있습니다.")
        }
    }
    
    func testBuyBeverage() {
        giveAccount(money: 10000)
        buy(at: 1)
    }
    //MARK: Fail
    func testBuyBeverageWithOutOfBudgetError() {
        giveAccount(money: 1000)
        buy(at: 1)
    }
    
    //MARK:- Test with Input
    //MARK: Success
    func testBuyBeverageInCategory() {
        giveAccount(money: 10000)
        let beverageCategoryCount = machine.bundles.count
        do {
            let _ = try Validator.validate("2 \(beverageCategoryCount)", with: machine.bundles)
        } catch let err {
            XCTFail("\((err as! VendingMachineError))")
        }
    }
    //MARK: Fail
    func testBuyBeverageWithNotExistedBeverageAtOverMaximumIndexError() {
        giveAccount(money: 10000)
        let beverageCategoryCount = machine.bundles.count
        do {
            let _ = try Validator.validate("2 \(beverageCategoryCount + 1)", with: machine.bundles)
        } catch let err {
            XCTFail("\((err as! VendingMachineError))")
        }
    }
    
    func testBuyBeverageWithNotExistedBeverageAt0IndexError() {
        giveAccount(money: 10000)
        do {
            let _ = try Validator.validate("2 0", with: machine.bundles)
        } catch let err {
            XCTFail("\((err as! VendingMachineError))")
        }
    }
    
    func testBuyBeverageWithOutOfMenuRangeError() {
        giveAccount(money: 10000)
        let beverageCategoryCount = machine.bundles.count
        do {
            let _ = try Validator.validate("0", with: machine.bundles)
        } catch let err {
            XCTFail("\((err as! VendingMachineError))")
        }
    }
    
    //MARK: Methods
    private func buy(at itemIndex: Int) {
        let before = giveAvailableBeveragesInStocks()
        do {
            let item = try machine.buy(at: itemIndex)
            let after = giveAvailableBeveragesInStocks()
            XCTAssertTrue(before.contains(item), "구매한 음료가 일치하지 않습니다.")
            XCTAssertFalse(after.contains(item), "구매한 음료가 여전히 재고에 존재합니다.")
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
    
    private func giveAvailableBeveragesInStocks() -> Bundles {
        return machine.bundles
    }
}
