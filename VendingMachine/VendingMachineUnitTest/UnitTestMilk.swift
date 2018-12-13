//
//  UnitTestMilk.swift
//  VendingMachineUnitTest
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestMilk: XCTestCase {
    private var strawberryMilk: StrawberryMilk!
    private var chocolateMilk: ChocolateMilk!
    private var pureMilk: Milk!

    override func setUp() {
        super.setUp()
        self.strawberryMilk = StrawberryMilk(
            brand: "서울우유",
            name: "언니몰래먹는딸기우유",
            volume: 200,
            price: 2000,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 8),
            package: .plastic)
        self.chocolateMilk = ChocolateMilk(
            brand: "푸르밀",
            name: "가나초코우유",
            volume: 300,
            price: 1200,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 12))
        self.pureMilk = Milk.init(
            brand: "남양유업",
            name: "맛있는우유GT",
            volume: 200,
            price: 900,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 3),
            flavor: nil)
    }

    func testClassMilkHasRightCategory() {
        XCTAssertEqual(pureMilk.group, BeverageCategory.milk)
    }

    func testClassMilkAndOneSubClassOfMilkHaveSameGroup() {
        XCTAssertEqual(pureMilk.group, strawberryMilk.group)
    }

    func testClassMilkAndAnotherSubClassOfMilkHaveSameGroup() {
        XCTAssertEqual(pureMilk.group, chocolateMilk.group)
    }

    func testSubClassesOfMilkHaveSameGroup() {
        XCTAssertEqual(strawberryMilk.group, chocolateMilk.group)
    }

    func testClassMilk_NamedPureMilk_HasNoFlavor() {
        XCTAssertFalse(pureMilk.hasFlavor())
    }

    func testSubClassOfMilk_NamedStrawberryMilk_HasFlavor() {
        XCTAssertTrue(strawberryMilk.hasFlavor())
    }

    func testSubClassOfMilk_NamedChocolateMilk_HasFlavor() {
        XCTAssertTrue(chocolateMilk.hasFlavor())
    }

    func testClassMilk_NamedPureMilk_ValidatesNow() {
        let now = Date()
        XCTAssertTrue(pureMilk.validate(when: now))
    }

    func testSubClassOfMilk_NamedStrawberryMilk_ValidatesNow() {
        let now = Date()
        XCTAssertTrue(strawberryMilk.validate(when: now))
    }

    func testSubClassOfMilk_NamedChocolateMilk_DoesNotValidatesNow() {
        let now = Date()
        XCTAssertFalse(chocolateMilk.validate(when: now))
    }

}
