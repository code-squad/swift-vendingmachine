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
        XCTAssertTrue(ValidChecker.checkInput(string: "1 1000000"))
    }
    
    func testCheckInputOfInsertMoneyFalse() {
        XCTAssertFalse(ValidChecker.checkInput(string: "11000000"))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
