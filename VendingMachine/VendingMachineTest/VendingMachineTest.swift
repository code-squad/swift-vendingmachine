//
//  VendingMachineTest.swift
//  VendingMachineTest
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class VendingMachineTest: XCTestCase {

    func test_ManufacturerCode_StrawberryMilk() {
        let strawberryMilk = StrawBerryMilk("서울우유", 200, 1000, "날마다딸기우유", Date(timeIntervalSinceNow: 0), 1001, packingMaterial: "종이", expirationDate: Date(timeIntervalSinceNow: 60*60*24*7), calories: 210)
        let factoryCodeValidate = strawberryMilk.isManufacturedFrom(1001)
        XCTAssertEqual(factoryCodeValidate, true)
    }

    func test_Validation_BananaMilk() {
        let bananaMilk = BananaMilk("서울우유", 200, 1000, "날마다바나나우유", Date(timeIntervalSinceNow: 0), 1001, packingMaterial: "종이", expirationDate: Date(timeIntervalSinceNow: 60*60*24*7), calories: 220)
        let isTodayValidate = bananaMilk.validate(with: Date(timeIntervalSinceNow: 60*60*24*8))
        XCTAssertEqual(isTodayValidate, false)
    }

    func test_IsLowCalorie_ChocoMilk() {
        let chocoMilk = ChocoMilk("서울우유", 200, 1000, "날마다초코우유", Date(timeIntervalSinceNow: 0), 1001, packingMaterial: "종이", expirationDate: Date(timeIntervalSinceNow: 60*60*24*7), calories: 240)
        let isLowCalorie = chocoMilk.isLowCalorie()
        XCTAssertEqual(isLowCalorie, false)
    }

    func test_Validation_Coke() {
        let coke = CokeSoftDrink("펩시", 350, 2000, "다이어트콜라", Date(timeIntervalSinceNow: 0), carbonContent: 50, expirationDate: Date(timeIntervalSinceNow: 60*60*24*30*6), calories: 250)
        let isTodayValidate = coke.validate(with: Date(timeIntervalSinceNow: 60*60*24*30*3))
        XCTAssertEqual(isTodayValidate, true)
    }

    func test_IsLowCalorie_Cider() {
        let cider = CiderSoftDrink("롯데칠성음료", 350, 2000, "사이다", Date(timeIntervalSinceNow: 0), carbonContent: 60, expirationDate: Date(timeIntervalSinceNow: 60*60*24*30*6), calories: 270)
        XCTAssertEqual(cider.isLowCalorie(), false)
    }

    func test_ContainsCarbonicGas_Fanta() {
        let fanta = FantaSoftDrink("코카콜라컴퍼니", 350, 2000, "환타", Date(timeIntervalSinceNow: 0), carbonContent: 40, expirationDate: Date(timeIntervalSinceNow: 60*60*24*30*7), calories: 300)
        XCTAssertEqual(fanta.containsCarbonicGas, true)
    }

    func test_Validation_TOP() {
        let top = TopCoffee("맥심", 200, 2200, "티오피", Date(timeIntervalSinceNow: 0), caffeineLevels: 20, isHot: false, isSweetened: true, expirationDate: Date(timeIntervalSinceNow: 60*60*24*14), calories: 240)
        let isTodayValidate = top.validate(with: Date(timeIntervalSinceNow: 60*60*24*4))
        XCTAssertEqual(isTodayValidate, true)
    }

    func test_IsDecaffeinated_Cantata() {
        let cantata = CantataCoffee("롯데칠성음료", 200, 2000, "칸타타", Date(timeIntervalSinceNow: 0), caffeineLevels: 10, isHot: false, isSweetened: true, expirationDate: Date(timeIntervalSinceNow: 60*60*24*14), calories: 250)
        XCTAssertEqual(cantata.isDecaffeinated(), true)
    }

    func test_IsLowCalorie_Georgia() {
        let georgia = GeorgiaCoffee("", 150, 1400, "조지아커피", Date.init(timeIntervalSinceNow: 0), caffeineLevels: 25, isHot: true, isSweetened: false, expirationDate: Date.init(timeIntervalSinceNow: 60*60*24*2), calories: 100)
        XCTAssertEqual(georgia.isLowCalorie(), true)
    }

    func test_IsUnsweetened_Georgia() {
        let georgia = GeorgiaCoffee("", 150, 1400, "조지아커피", Date.init(timeIntervalSinceNow: 0), caffeineLevels: 25, isHot: true, isSweetened: false, expirationDate: Date.init(timeIntervalSinceNow: 60*60*24*2), calories: 100)
        XCTAssertEqual(georgia.isUnSweetened(), true)
    }

}
