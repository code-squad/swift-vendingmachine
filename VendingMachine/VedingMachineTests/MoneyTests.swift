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
        var money = Money(0)
        money.insert(coin: .fiveThousand)
        money.insert(coin: .hundred)
        XCTAssertTrue(money.countChange() == 5100)
    }

}
