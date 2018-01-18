//
//  VedingMachineTests.swift
//  VedingMachineTests
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class VedingMachineTests: XCTestCase {
    let today = DateUtility.today()
    
    func test_동전_삽입() {
        let money = Money(0)
        let vendingMachine = VendingMachine(money: money)
        vendingMachine.insertMoney(coin: .fiveHundred)
        vendingMachine.insertMoney(coin: .fiveThousand)
        XCTAssertTrue(vendingMachine.countChange() == 5500)
    }
    
}
