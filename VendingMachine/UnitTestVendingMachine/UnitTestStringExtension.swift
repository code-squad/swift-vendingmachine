//
//  UnitTestStringExtension.swift
//  UnitTestVendingMachine
//
//  Created by yangpc on 2017. 11. 17..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest
@testable import VendingMachine
class UnitTestStringExtension: XCTestCase {
    var calorieFail: String!
    var calorieSuccess: String!
    var gramFail: String!
    var gramSuccess: String!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calorieFail = "100cal"
        calorieSuccess = "200kcal"
        
        gramFail = "102gg"
        gramSuccess = "300g"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        calorieFail = nil
        calorieSuccess = nil
        gramFail = nil
        gramSuccess = nil
    }
    
    func testConvertToKilocalorieFail() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNil(calorieFail.convertToInt(from: "kcal"))
    }
    
    func testConvertToKilocalorieSuccess() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(calorieSuccess.convertToInt(from: "kcal"))
    }
    
    func testConvertToGramFail() {
        XCTAssertNil(gramFail.convertToInt(from: "g"))
    }
    
    func testConvertToGramSuccess() {
        XCTAssertNotNil(gramSuccess.convertToInt(from: "g"))
    }
    
}

