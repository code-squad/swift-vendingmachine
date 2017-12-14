//
//  ValidationCheckerTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 12..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class ValidationCheckerTest: XCTestCase {
    var validationChecker: ValidationChecker!

    override func setUp() {
        super.setUp()
        validationChecker = ValidationChecker()
    }

    override func tearDown() {
        validationChecker = nil
        super.tearDown()
    }

    func testGetSelector_Errors() {
        XCTAssertThrowsError(try ValidationChecker.getSelector(input: "q"))
        XCTAssertThrowsError(try ValidationChecker.getSelector(input: "quit"))
        XCTAssertThrowsError(try ValidationChecker.getSelector(input: "1"))
        XCTAssertThrowsError(try ValidationChecker.getSelector(input: "1 2 3"))
        XCTAssertThrowsError(try ValidationChecker.getSelector(input: "test"))
        XCTAssertThrowsError(try ValidationChecker.getSelector(input: "2 test"))

        XCTAssertNoThrow(try ValidationChecker.getSelector(input: "1 2000"))
        XCTAssertNoThrow(try ValidationChecker.getSelector(input: "2 2"))
        XCTAssertNoThrow(try ValidationChecker.getSelector(input: "3"))
        XCTAssertNoThrow(try ValidationChecker.getSelector(input: "3 test"))
    }

    func testGetSelector_return() {
        XCTAssertEqual(try ValidationChecker.getSelector(input: "1 2000").0, ValidationChecker.VendingMenu.insertCoins)
        XCTAssertEqual(try ValidationChecker.getSelector(input: "1 2000").1, 2000)
        XCTAssertEqual(try ValidationChecker.getSelector(input: "2 4").0, ValidationChecker.VendingMenu.buyProduct)
        XCTAssertEqual(try ValidationChecker.getSelector(input: "2 4").1, 4)
        XCTAssertEqual(try ValidationChecker.getSelector(input: "3").0, ValidationChecker.VendingMenu.purchaseList)
        XCTAssertEqual(try ValidationChecker.getSelector(input: "3").1, 0)
    }

    func testGetAdminSelector_Errors() {
        XCTAssertThrowsError(try ValidationChecker.getAdminSelector(input: "q"))
        XCTAssertThrowsError(try ValidationChecker.getAdminSelector(input: "quit"))
        XCTAssertThrowsError(try ValidationChecker.getAdminSelector(input: "1 2 3"))
        XCTAssertThrowsError(try ValidationChecker.getAdminSelector(input: "test"))
        XCTAssertThrowsError(try ValidationChecker.getAdminSelector(input: "2 test"))
    }

    func testGetAdminSelector_return() {
        XCTAssertEqual(try ValidationChecker.getAdminSelector(input: "1"), ValidationChecker.AdminMenu.addProducts)
        XCTAssertEqual(try ValidationChecker.getAdminSelector(input: "2"), ValidationChecker.AdminMenu.removeExpired)
        XCTAssertEqual(try ValidationChecker.getAdminSelector(input: "3"), ValidationChecker.AdminMenu.salesHistory)
    }

}
