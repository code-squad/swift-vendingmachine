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
    
    var coffee: Coffee!
    
    override func setUp() {
        super.setUp()
        
        self.coffee = Coffee(brand: "맥심", capacity: 400, price: 3000, name: "그냥커피", manufacturedDate: "20180606", caffeineContent: 150)
    }
    
    func testCoffeeInstantiate_success() {
        let coffee: Coffee = Coffee(brand: "맥심", capacity: 400, price: 3000, name: "그냥커피", manufacturedDate: "20180606", caffeineContent: 150)
        XCTAssertNotNil(coffee)
    }
    
    func testCoffeeIsNonCaffeine() {
        let coffee: Coffee = Coffee(brand: "맥심", capacity: 400, price: 3000, name: "그냥커피", manufacturedDate: "20180606", caffeineContent: 0)
        XCTAssertTrue(coffee.isNonCaffeine())
    }
    
    func testCoffeeContainCaffeine() {
        XCTAssertFalse(self.coffee.isNonCaffeine())
    }
}
