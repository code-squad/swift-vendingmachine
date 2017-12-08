//
//  KantataTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZero. All rights reserved.
//

import XCTest

@testable import VendingMachine

class KantataTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testKantata() {
        let kantata = Kantata.init(brand: "칸타타", weight: 400, price: 3000, name: "Kantata", hot: true)
        XCTAssertEqual(kantata.description, "칸타타커피(Kantata) - 칸타타, 400ml, 3000원, Kantata, 20171208")
    }

}
