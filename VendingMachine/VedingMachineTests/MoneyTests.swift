//
//  MoneyTests.swift
//  VedingMachineTests
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class MoneyTests: XCTestCase {
    func test_동전_삽입_성공() throws {
        var money = Money(0)
        money = try money.plus(coin: Money(5000))
        money = try money.plus(coin: Money(5100))
        XCTAssertTrue(money.countChange() == 10100)
    }
    
    func test_동전_삽입_실패() throws {
        XCTAssertThrowsError(try Money(0).plus(coin: Money(-100)))
    }
 
    func test_동전_차감_성공() throws {
        var money = Money(0)
        money = try money.plus(coin: Money(5000))
        money = try money.plus(coin: Money(100))
        money = try money.subtract(coin: Money(140))
        XCTAssertTrue(money.countChange() == 4960)
    }

    func test_동전_차감_실패() throws {
        XCTAssertThrowsError(try Money(0).subtract(coin: Money(140)))
    }

}
