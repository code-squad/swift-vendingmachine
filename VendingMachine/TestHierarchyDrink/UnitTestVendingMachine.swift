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
        let successInsertCoin: State = userMode.isAbleToInsert(coin: 10000)
        XCTAssertEqual(successInsertCoin, .success)
    }
    
    func testIsAbleToInsertAtNagative() {
        let userMode = machine as UserAvailableMode
        let nagativeInsertFail: State = userMode.isAbleToInsert(coin: -10000)
        XCTAssertEqual(nagativeInsertFail, .negative)
    }
    
    func testIsAbleToPickAtNotExist() {
        let userMode = machine as UserAvailableMode
        let notExistMenu: State = userMode.isAbleToPick(menu: 7)
        XCTAssertEqual(notExistMenu, .notExist)
    }
    
    func testIsAbleToPickAtNotEnough() {
        let userMode = machine as UserAvailableMode
        userMode.pick(menu: 6)
        userMode.pick(menu: 6)
        let notEnoughStock: State = userMode.isAbleToPick(menu: 6)
        XCTAssertEqual(notEnoughStock, .notEnough)
    }
    
    func testIsAbleToPickAtFail() {
        let userMode = machine as UserAvailableMode
        let notEnoughCoin: State = userMode.isAbleToPick(menu: 5)
        XCTAssertEqual(notEnoughCoin, .fail)
    }
    
    func testGetPurchaseList() {
        let userMode = machine as UserAvailableMode
        userMode.insert(coin: 1500)
        XCTAssertEqual(userMode.getPurchaseListInsertedCoin().count, 2)
    }
    
    func testIsAbleToAddAtNotExist() {
        let managerMode = machine as ManageableMode
        let notExistMenu: State = managerMode.isAbleToAdd(menu: 7)
        XCTAssertEqual(notExistMenu, .notExist)
    }
    
    func testIsAbleToAddAtSuccess() {
        let managerMode = machine as ManageableMode
        let successToAdd: State = managerMode.isAbleToAdd(menu: 6)
        XCTAssertEqual(successToAdd, .success)
    }
    
    func testIsAbleToRemoveAtNotExist() {
        let managerMode = machine as ManageableMode
        let notExistMenu: State = managerMode.isAbleToRemove(menu: 7)
        XCTAssertEqual(notExistMenu, .notExist)
    }
    
    func testIsAbleToRemoveAtNotEnough() {
        let managerMode = machine as ManageableMode
        managerMode.removeDrink(6)
        managerMode.removeDrink(6)
        let alreadyEmpty: State = managerMode.isAbleToRemove(menu: 6)
        XCTAssertEqual(alreadyEmpty, .notEnough)
    }
    
    func testIsAbleToRemoveAtSuccess() {
        let managerMode = machine as ManageableMode
        let successToRemove: State = managerMode.isAbleToRemove(menu: 6)
        XCTAssertEqual(successToRemove, .success)
    }
}
