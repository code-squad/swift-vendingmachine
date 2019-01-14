//
//  UnitTestCoffeeInterface.swift
//  TestHierarchyDrink
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestCoffeeInterface: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCoffeeInterface() {
        let coffee: Coffee = Coffee(name: "맥심", volume: 350, price: 3500, brand: "TOP아메리카노", date: "20190310", caffeineAmount: 1.3)
        XCTAssertEqual(coffee.howMuchCaffeineAmount(), 1.3)
    }
    
    func testCantataInterface() {
        let cantata: Cantata = Cantata(name: "칸타타", volume: 300, brand: "Cantata아메리카노", date: "20181226", caffeineAmount: 1.3, material: .cans)
        XCTAssertEqual(cantata.isCanPacking(), true)
    }
    
    func testTOPInterface() {
        let top: TOP = TOP(name: "TOP", volume: 325, brand: "TOP블랙", date: "20181210", caffeineAmount: 1.3, topKind: .black)
        XCTAssertEqual(top.isAmericano(), false)
    }

}
