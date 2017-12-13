//
//  CoffeeUnitTest.swift
//  CoffeeUnitTest
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest
@testable import VendingMachine

class CoffeeUnitTest: XCTestCase {
    let starBucks = StarBucksCoffee(volume: 500, price: 5600, manufacturingDate: "20171213", caffeine: false)
    
    func testDeCaffeineCoffee() {
        XCTAssertFalse(starBucks.hasCaffeine())
    }
    
    func testValidDate() {
        XCTAssertTrue(starBucks.validate(with: Date()))
    }
}
