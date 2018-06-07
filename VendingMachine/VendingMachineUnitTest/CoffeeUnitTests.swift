//
//  CoffeeUnitTests.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class CoffeeUnitTests: XCTestCase {
    
    func testCoffeeInstantiate_success() {
        let coffee: Coffee = Coffee(brand: "맥심", capacity: 400, price: 3000, name: "그냥커피", manufacturedDate: "20180606", caffeineContent: 150)
        XCTAssertNotNil(coffee)
    }
}
