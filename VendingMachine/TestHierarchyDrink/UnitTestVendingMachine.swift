//
//  UnitTestVendingMachine.swift
//  TestHierarchyDrink
//
//  Created by 윤동민 on 07/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    var machine : VendingMachine!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        machine = VendingMachine()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInsertPositive() {
        let state : State = machine.insert(coin: 1000)
        XCTAssertEqual(state, .success)
    }
    
    func testInsertNegative() {
        let state : State = machine.insert(coin: -100)
        XCTAssertEqual(state, .negative)
    }

}
