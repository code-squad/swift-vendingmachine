//
//  VendingMachineUnitTests.swift
//  VendingMachineUnitTests
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class VendingMachineUnitTests: XCTestCase {
    
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
