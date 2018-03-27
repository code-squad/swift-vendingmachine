//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    func test_isNotNil_Milk() {
        let testMilk = Milk("신선한정훈", 200, 1000, "맛좋은우유", "20180301", .first_Grade)
        XCTAssertNotNil(testMilk)
    }

    func test_isNotNil_BananaFlavored() {
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180305", .second_Grade, 72, 0.7)
        XCTAssertNotNil(bananaFlavord)
    }

    func test_isNotNil_ChochoFlavored() {
        let chocoFlavored = ChocoFlavoredMilk("신선한정훈", 250, 1500, "맛좋은초코우유", "20180307", .first_Grade, 62, 1.6)
        XCTAssertNotNil(chocoFlavored)
    }

    func test_isNotNil_Soda() {
        let soda = Soda("톡쏘는정훈", 300, 1000, "맛좋은소다", "20171005", 50)
        XCTAssertNotNil(soda)
    }

    func test_isNotNil_Coke() {
        let coke = Coke("톡쏘는정훈", 250, 1000, "맛좋은코크", "20170907", 100, .original)
        XCTAssertNotNil(coke)
    }

    func test_isNotNil_Welchs() {
        let welchs = Welchs("톡쏘는정훈", 200, 1500, "맛좋은웰취스", "20171001", 110, .strawberry)
        XCTAssertNotNil(welchs)
    }

    func test_isNotNil_Coffee() {
        let coffee = Coffee("부드러운정훈", 250, 1000, "더커피", "20171223", .venti)
        XCTAssertNotNil(coffee)
    }

    func test_isNotNil_Americano() {
        let americano = Americano("부드러운정훈", 250, 2000, "더아메리카노", "20180115", .short, .threeShot)
        XCTAssertNotNil(americano)
    }

    func test_isNotNil_Top() {
        let top = Top("부드러운정훈", 300, 1000, "더티오피", "20171113", .tall, .simplieSmooth)
        XCTAssertNotNil(top)

    }

    func test_isNotNil_DutchCoffeeStory() {
        let dutchCoffeeStory = DutchCoffeeStory("부드러운정훈", 200, 3000, "더치커피스토리", "20180225", .short, .forFamilyUse)
        XCTAssertNotNil(dutchCoffeeStory)
    }

    func test_isHighSugarContent() {
        let welchs = Welchs("톡쏘는정훈", 200, 1500, "맛좋은웰취스", "20171001", 110, .strawberry)
        XCTAssertTrue(welchs.isHighSugarcontent())
    }

    func test_isLowCalorie() {
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180305", .second_Grade, 72, 0.7)
        XCTAssertFalse(bananaFlavord.isLowCalorie())
    }

    func test_isHighBananaConcentration() {
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180305", .second_Grade, 72, 0.7)
        XCTAssertFalse(bananaFlavord.isHighBananaConcentration())
    }

    func test_isHighChocolateConcentration() {
        let chocoFlavored = ChocoFlavoredMilk("신선한정훈", 250, 1500, "맛좋은초코우유", "20180307", .first_Grade, 62, 1.6)
        XCTAssertTrue(chocoFlavored.isHighChocolateConcentration())
    }

    func test_isValidate() {
        let testMilk = Milk("신선한정훈", 200, 1000, "맛좋은우유", "20180301", .first_Grade)
        XCTAssertTrue(testMilk.isValidate())
    }
}
