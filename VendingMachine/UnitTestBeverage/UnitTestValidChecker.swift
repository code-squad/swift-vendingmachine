//
//  UnitTestValidChecker.swift
//  UnitTestBeverage
//
//  Created by 조재흥 on 18. 12. 21..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestValidChecker: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckInputOfInsertMoneyTrue() {
        XCTAssertTrue(ValidChecker.checkUserInput(string: "1 1000000", count: 5))
    }

    func testCheckInputOfInsertMoneyFalse() {
        XCTAssertFalse(ValidChecker.checkUserInput(string: "11000000", count: 5))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
