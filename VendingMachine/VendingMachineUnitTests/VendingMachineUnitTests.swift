//
//  VendingMachineUnitTests.swift
//  VendingMachineUnitTests
//
//  Created by Daheen Lee on 22/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class VendingMachineUnitTests: XCTestCase {
    let manufacturedDate: String = "20190801"
    let expirationDate: String = "20190810"
    
    var beverage: Beverage!

    override func setUp() {
        beverage = Beverage(manufacturer: "매일우유", dateOfManufactured: manufacturedDate, expirationDate: expirationDate, brand: "우유속에", name: "코코아", capacity: 310, unit: .milliliters, price: 1500)
    }

    override func tearDown() {
        beverage = nil
    }

    func test_validate_method_check_valid_date() {
        let validDate: Date = Date(string: "20190801")
        let isOkayToDrink = beverage.validate(with: validDate)
        
        XCTAssertTrue(isOkayToDrink, "Test with valid date Failed - Beverage : validate method")
    }
    
    func test_validate_method_check_invalid_date() {
        let invalidDate: Date = Date(string: "20190811")
        let isOkayToDrink = beverage.validate(with: invalidDate)
        
        XCTAssertFalse(isOkayToDrink, "Test with invalid date Failed - Beverage : validate method")
    }
    
    func test_DateConverter() {
        let dateString = "20190825"
        let date = DateConverter.toDate(from: dateString)
        let convertedDate = DateConverter.toString(from: date)
        XCTAssertEqual(dateString, convertedDate)
    }
    
}
