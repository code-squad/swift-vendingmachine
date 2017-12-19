//
//  VendingMachineTest.swift
//  VendingMachineTest
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

// 음료수 객체 테스트.
class BeverageTest: XCTestCase {

    func test_ManufacturerCode_StrawberryMilk() {
        let strawberryMilk = StrawBerryMilk("서울우유", 200, 1000, "날마다딸기우유", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*7), 210, VendingMachine.Menu.strawberryMilk, manufacturerCode: 1001, packingMaterial: "종이")
        let factoryCodeValidate = strawberryMilk.isManufacturedFrom(1001)
        XCTAssertEqual(factoryCodeValidate, true)
    }

    func test_Validation_BananaMilk() {
        let bananaMilk = BananaMilk("서울우유", 200, 1000, "날마다바나나우유", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*7), 220, VendingMachine.Menu.bananaMilk, manufacturerCode: 1001, packingMaterial: "종이")
        let isTodayValidate = bananaMilk.isExpired(with: Date(timeIntervalSinceNow: 60*60*24*8))
        XCTAssertEqual(isTodayValidate, true)
    }

    func test_IsLowCalorie_ChocoMilk() {
        let chocoMilk = ChocoMilk("서울우유", 200, 1000, "날마다초코우유", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*7), 240, VendingMachine.Menu.chocoMilk, manufacturerCode: 1001, packingMaterial: "종이")
        let isLowCalorie = chocoMilk.isLowCalorie()
        XCTAssertEqual(isLowCalorie, false)
    }

    func test_Validation_Coke() {
        let coke = CokeSoftDrink("펩시", 350, 2000, "다이어트콜라", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*30*6), 250, VendingMachine.Menu.coke, carbonContent: 50)
        let isTodayValidate = coke.isExpired(with: Date(timeIntervalSinceNow: 60*60*24*30*3))
        XCTAssertEqual(isTodayValidate, false)
    }

    func test_IsLowCalorie_Cider() {
        let cider = CiderSoftDrink("롯데칠성음료", 350, 2000, "사이다", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*30*6), 250, VendingMachine.Menu.cider, carbonContent: 60)
        XCTAssertEqual(cider.isLowCalorie(), false)
    }

    func test_ContainsCarbonicGas_Fanta() {
        let fanta = FantaSoftDrink("코카콜라컴퍼니", 350, 2000, "환타", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*30*7), 300, VendingMachine.Menu.fanta, carbonContent: 40)
        XCTAssertEqual(fanta.containsCarbonicGas, true)
    }

    func test_Validation_TOP() {
        let top = TopCoffee("맥심", 200, 2200, "티오피", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*14), 240, VendingMachine.Menu.top, caffeineLevels: 20, isHot: false, isSweetened: true)
        let isTodayValidate = top.isExpired(with: Date(timeIntervalSinceNow: 60*60*24*4))
        XCTAssertEqual(isTodayValidate, false)
    }

    func test_IsDecaffeinated_Cantata() {
        let cantata = CantataCoffee("롯데칠성음료", 200, 2200, "칸타타", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*14), 250, VendingMachine.Menu.cantata, caffeineLevels: 10, isHot: false, isSweetened: true)
        XCTAssertEqual(cantata.isDecaffeinated(), true)
    }

    func test_IsLowCalorie_Georgia() {
        let georgia = GeorgiaCoffee("코카콜라", 200, 2200, "조지아커피", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*2), 100, VendingMachine.Menu.georgia, caffeineLevels: 25, isHot: true, isSweetened: false)
        XCTAssertEqual(georgia.isLowCalorie(), true)
    }

    func test_IsUnsweetened_Georgia() {
        let georgia = GeorgiaCoffee("코카콜라", 200, 2200, "조지아커피", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*2), 100, VendingMachine.Menu.georgia, caffeineLevels: 25, isHot: true, isSweetened: false)
        XCTAssertEqual(georgia.isUnSweetened(), true)
    }

}
