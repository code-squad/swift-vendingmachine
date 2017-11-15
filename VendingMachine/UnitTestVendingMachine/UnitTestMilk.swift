//
//  UnitTestMilk.swift
//  UnitTestVendingMachine
//
//  Created by yangpc on 2017. 11. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest
@testable import VendingMachine
class UnitTestMilk: XCTestCase {
    var staleMilk: Milk!
    var freshMilk: Milk!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        staleMilk = Milk(productTpye: "우유", brand: "서울우유", weight: "200ml", price: "3000원", name: "날마다 우유", dateOfManufacture: "20170902", calorie: "200kcal")
        freshMilk = Milk(productTpye: "우유", brand: "서울우유", weight: "300ml", price: "5000원", name: "날마다우유", dateOfManufacture: "20171110", calorie: "150kcal", ingredients: ["lactose"])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testValidExpirationDateWithStaleMilk() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertFalse(staleMilk.valid(with: Date()))
    }

    func testValidExpirationDateWithFreshMilk() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(freshMilk.valid(with: Date()))
    }

}
