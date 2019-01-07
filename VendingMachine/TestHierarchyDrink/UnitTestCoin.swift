//
//  UnitTestCoin.swift
//  TestHierarchyDrink
//
//  Created by 윤동민 on 07/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestCoin: XCTestCase {
    var coin: Coin!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coin = Coin()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        coin = nil
    }
    
    func testIsEnoughToBuyTrue() {
        coin.add(1000)
        XCTAssertTrue(coin.isEnoughToBuy(of: 1000))
    }
    
    func testIsEnoughToBuyFalse() {
        coin.add(500)
        XCTAssertFalse(coin.isEnoughToBuy(of: 1000))
    }
}
