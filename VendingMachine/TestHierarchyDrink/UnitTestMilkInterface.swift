//
//  UnitTestMilkInterface.swift
//  TestHierarchyDrink
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestMilkInterface: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMilkInterface() {
        let milk = Milk(name: "서울우유", volume: 350, price: 2000, brand: "빙그레바나나우유", date: "20170801", fat: true)
        XCTAssertEqual(milk.isHighFatMilk(), true)
    }
    
    func testBananaMilkInterface() {
        let bananaMilk = BananaMilk(name: "서울우유", volume: 350, price: 2000, brand: "빙그레바나나우유", date: "20170810", fat: true, bananaAmount: 1.1)
        XCTAssertEqual(bananaMilk.howMuchJuiceAmount(), 1.1)
    }
    
    func testChocoMilkInterface() {
        let chocoMilk = ChocoMilk(name: "서울우유", volume: 350, price: 2000, brand: "빙그레초코우유", date: "20170810", fat: true, cocoaAmount: 0.7)
        XCTAssertEqual(chocoMilk.howMuchAmountCocoa(), 0.7)
    }

}
