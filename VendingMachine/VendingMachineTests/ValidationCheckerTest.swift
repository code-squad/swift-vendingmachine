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
        XCTAssertThrowsError(try validationChecker.getSelector(input: "q"))
        XCTAssertThrowsError(try validationChecker.getSelector(input: "quit"))
        XCTAssertThrowsError(try validationChecker.getSelector(input: "1"))
        XCTAssertThrowsError(try validationChecker.getSelector(input: "1 2 3"))
        XCTAssertThrowsError(try validationChecker.getSelector(input: "test"))
        XCTAssertThrowsError(try validationChecker.getSelector(input: "2 test"))

        XCTAssertNoThrow(try validationChecker.getSelector(input: "1 2000"))
        XCTAssertNoThrow(try validationChecker.getSelector(input: "2 2"))
        XCTAssertNoThrow(try validationChecker.getSelector(input: "3"))
        XCTAssertNoThrow(try validationChecker.getSelector(input: "3 test"))
    }

    func testGetSelector_return() {
        XCTAssertEqual(try validationChecker.getSelector(input: "1 2000").0, 1)
        XCTAssertEqual(try validationChecker.getSelector(input: "1 2000").1, 2000)
        XCTAssertEqual(try validationChecker.getSelector(input: "2 4").0, 2)
        XCTAssertEqual(try validationChecker.getSelector(input: "2 4").1, 4)
        XCTAssertEqual(try validationChecker.getSelector(input: "3").0, 3)
        XCTAssertEqual(try validationChecker.getSelector(input: "3").1, 0)
    }

}
