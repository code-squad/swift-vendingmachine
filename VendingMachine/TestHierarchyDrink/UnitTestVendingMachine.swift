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
        machine = nil
    }
    
    func testIsAbleToInsertAtSuccess() {
        let userMode = machine as UserAvailableMode
         XCTAssertEqual(userMode.isAbleToinsert(coin: 1000), .success)
    }
    
    func testIsAbleToInsertAtNagative() {
        let userMode = machine as UserAvailableMode
        XCTAssertEqual(userMode.isAbleToinsert(coin: -1000), .negative)
    }
    
    func testIsAbleToPickAtNotExist() {
        let userMode = machine as UserAvailableMode
        XCTAssertEqual(userMode.isAbleTopick(menu: 7), .notExist)
    }
    
    func testIsAbleToPickAtNotEnough() {
        let userMode = machine as UserAvailableMode
        userMode.pick(menu: 6)
        userMode.pick(menu: 6)
        XCTAssertEqual(userMode.isAbleTopick(menu: 6), .notEnough)
    }
    
    func testIsAbleToPickAtFail() {
        let userMode = machine as UserAvailableMode
        XCTAssertEqual(userMode.isAbleTopick(menu: 5), .fail)
    }
    
    func testGetPurchaseList() {
        let userMode = machine as UserAvailableMode
        userMode.insert(coin: 1500)
        XCTAssertEqual(userMode.getPurchaseListInsertedCoin().count, 2)
    }
}
