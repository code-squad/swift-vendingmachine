//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by 김수현 on 2018. 5. 28..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    
    var date: DateFormatter!
    var today: DateFormatter!
    
    override func setUp() {
        super.setUp()
        self.date = DateFormatter()
        date.dateFormat = "yyyyMMdd"
        self.today = DateFormatter()
        today.dateFormat = "yyyyMMdd"
    }
    
    func testStrawberryMilkNotNil() {
        let strawberryMilk = StrawberryMilk.init("서울우유", 200, 1000, "날마다딸기우유", date.date(from: "20180610")!)
        XCTAssertNotNil(strawberryMilk)
    }
    
    func testChocoMilkNotNil() {
        let chocoMilk = ChocoMilk.init("매일우유", 200, 1200, "초코초코", date.date(from: "20180611")!)
        XCTAssertNotNil(chocoMilk)
    }
    
    func testFantaNotNil() {
        let fanta = Fanta.init("환타", 350, 2000, "환타파인", date.date(from: "20181212")!)
        XCTAssertNotNil(fanta)
    }
    
    func testCantataNotNil() {
        let cantata = Cantata.init("롯데칠성", 350, 3000, "칸타타", date.date(from: "20190111")!)
        XCTAssertNotNil(cantata)
    }
    
    func testValidate() {
        let bananaMilk = BananaMilk.init("서울우유", 200, 1000, "바나나우유", date.date(from: "20180529")!)
        let validate = bananaMilk.validate(today.date(from: "20180528")!)
        XCTAssertTrue(validate)
    }
    
    func testInvalidate() {
        let strawberryMilk = StrawberryMilk.init("서울우유", 200, 1000, "딸기우유", date.date(from: "20180527")!)
        let invalidate = strawberryMilk.validate(today.date(from: "20180528")!)
        XCTAssertFalse(invalidate)
    }
    
    func testIsHotTrue() {
        let georgia = Georgia.init("조지아", 350, 2500, "아메리카노", date.date(from: "20180630")!)
        let americano = georgia.isHot()
        XCTAssertTrue(americano)
    }
    
    func testIsHotFalse() {
        let top = Top.init("맥심", 350, 3000, "티오피", date.date(from: "20180701")!)
        let ice = top.isHot()
        XCTAssertFalse(ice)
    }
    
    func testCheckFarmCode() {
        let strawberryMilk = StrawberryMilk.init("서울우유", 200, 1000, "딸기우유", date.date(from: "20180527")!)
        let farmCode = strawberryMilk.checkFarmCode()
        XCTAssertEqual(farmCode, "farmJeju")
    }
    
    func testIsLowCalorieTrue() {
        let coke = Coke.init("코카콜라", 500, 3000, "제로콜라", date.date(from: "20190303")!)
        let dietCoke = coke.isLowCalorie()
        XCTAssertTrue(dietCoke)
    }
    
    func testIsLowCalorieFalse() {
        let sprite = Sprite.init("스프라이트", 500, 2000, "스프라잇", date.date(from: "20190202")!)
        let spriteCalorie = sprite.isLowCalorie()
        XCTAssertFalse(spriteCalorie)
    }

}
