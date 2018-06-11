//
//  BeverageUnitTests.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class BeverageUnitTests: XCTestCase {
    
    var beverage: Beverage!
    
    override func setUp() {
        super.setUp()
        
        self.beverage = Beverage(brand: "서울우유", capacity: 200, price: 1000, name: "날마다딸기우유", manufacturedDate: "20171009")
    }
    
    func testBeverageInstantiate_success() {
        XCTAssertNotNil(Beverage(brand: "서울우유", capacity: 200, price: 1000, name: "날마다딸기우유", manufacturedDate: "20171009"))
    }
    
    func testBeverageDescription() {
        XCTAssertEqual(beverage.description, "Beverage - 서울우유, 200ml, 1000원, 날마다딸기우유, 20171009")
    }
    
    func testBeveragePriceIsExpensiveThan_999_won() {
        XCTAssertTrue(beverage.isExpensive(than: 999))
    }
    
    func testBeveragePriceIsNotExpensiveThan_1000_won() {
        XCTAssertFalse(beverage.isExpensive(than: 1000))
    }
    
    func testBeveragePriceIsNotExpensiveThan_1001_won() {
        XCTAssertFalse(beverage.isExpensive(than: 1001))
    }
    
    
}
