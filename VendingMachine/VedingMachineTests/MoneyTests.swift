//
//  MoneyTests.swift
//  VedingMachineTests
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class MoneyTests: XCTestCase {
    func test_동전_삽입() {
        var money = Money()
        money.insert(coin: .fiveThousand)
        money.insert(coin: .hundred)
        XCTAssertTrue(money.countChange() == 5100)
    }
    
    func test_동전_차감() throws {
        var money = Money()
        money.insert(coin: .fiveThousand)
        money.insert(coin: .hundred)
        try money.deduct(coin: 140)
        XCTAssertTrue(money.countChange() == 4960)
    }
    
    func test_동전_차감_실패() throws {
        var money = Money()
        XCTAssertThrowsError(try money.deduct(coin: 140))
    }

}
