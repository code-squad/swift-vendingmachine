//
//  UnitTestCoffee.swift
//  VendingMachineUnitTest
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestCoffee: XCTestCase {
    private var cantata: Cantata!
    private var georgia: Georgia!
    private var coffee: Coffee!

    override func setUp() {
        self.cantata = Cantata(
            name: "칸타타 더치블랙",
            volume: 275,
            price: 2200,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 8),
            ice: false)
        self.georgia = Georgia(
            name: "조지아 카페라떼",
            volume: 300,
            price: 2500,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 20),
            ice: false)
        self.coffee = Coffee(
            brand: "스타벅스",
            name: "스타벅스 카페라떼",
            volume: 215,
            price: 1700,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 12),
            ice: true)
    }

    func testClassCoffeeHasRightCategory() {
        XCTAssertEqual(coffee.group, BeverageCategory.coffee)
    }

    func testClassCoffeeAndOneSubClassOfCoffeeHaveSameGroup() {
        XCTAssertTrue(cantata.isInSameGroup(with: coffee))
    }

    func testClassCoffeeAndAnotherSubClassOfCoffeeHaveSameGroup() {
        XCTAssertTrue(georgia.isInSameGroup(with: coffee))
    }

    func testClassCoffee_isNotHot() {
        XCTAssertFalse(coffee.isHot())
    }

    func testSubClassOfCoffee_NamedCantata_isHot() {
        XCTAssertTrue(cantata.isHot())
    }

    func testSubClassOfCoffee_NamedGeorgia_isHot() {
        XCTAssertTrue(georgia.isHot())
    }

}
