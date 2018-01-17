//
//  VendingMachineUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class VendingMachineUnitTest: XCTestCase {
    var form: DateFormatter!
    override func setUp() {
        super.setUp()
        self.form = DateFormatter()
        form.dateFormat = "yyyyMMdd"
    }
    
    func test_딸기우유객체생성여부() {
        let strawberryMilk = StrawberryMilk(brand: "서울우유", name: "날마다딸기우유", volume: 200, price: 1000, manufacturedDate: form.date(from: "20170117") ?? Date())
        XCTAssertNotNil(strawberryMilk)
//        XCTAssertFalse(strawberryMilk.validate(with: form.date(from: "20170203") ?? Date()))
    }
    
    func test_바나나우유객체생성여부() {
        let bananaMilk = BananaMilk(brand: "서울우유", name: "날마다바나나우유", volume: 200, price: 1000, manufacturedDate: form.date(from: "20170116") ?? Date())
        XCTAssertNotNil(bananaMilk)
    }
    
    func test_초코우유객체생성및메서드() {
        let chocolateMilk = ChocolateMilk(brand: "서울우유", name: "날마다초코우유", volume: 200, price: 1000, manufacturedDate: form.date(from: "20170115") ?? Date())
        XCTAssertNotNil(chocolateMilk)
    }
    
    func test_우유객체공통메서드() {
        let milk = Milk(brand: "매일우유", name: "키크는우유", volume: 200, price: 500, manufacturedDate: form.date(from: "20170115") ?? Date())
        XCTAssertFalse(milk.validate(with: form.date(from: "20170131") ?? Date()))
        XCTAssertTrue(milk.validate(with: form.date(from: "20170106") ?? Date()))
    }

    func test_팹시콜라객체생성여부() {
        let pepsi = PepciCoke(brand: "팹시", name: "다이어트콜라", volume: 350, price: 2000, manufacturedDate: form.date(from: "20170201") ?? Date(), lowCalorie: true)
        XCTAssertNotNil(pepsi)
    }
    
    func test_스프라이트객체생성여부() {
        let sprite = Sprite(brand: "코카콜라", name: "사이다", volume: 350, price: 2000, manufacturedDate: form.date(from: "20170202") ?? Date(), lowCalorie: false)
        XCTAssertNotNil(sprite)
    }
    
    func test_환타객체생성여부() {
        let fanta = Fanta(brand: "환타", name: "환타오렌지", volume: 350, price: 2000, manufacturedDate: form.date(from: "20170203") ?? Date(), lowCalorie: true)
        XCTAssertNotNil(fanta)
    }
    
    func test_탄산음료객체공통메서드() {
        let sodaPop = SodaPop(brand: "코카콜라", name: "제로콜라", volume: 200, price: 500, manufacturedDate: form.date(from: "20170107") ?? Date(), lowCalorie: true)
        XCTAssertTrue(sodaPop.isLowCalorie())
    }
    
    func test_TOP커피객체생성여부() {
        let topCoffee = TOPCoffee(brand: "맥심", name: "TOP아메리카노", volume: 400, price: 3000, manufacturedDate: form.date(from: "20170110") ?? Date(), hot : false)
        XCTAssertNotNil(topCoffee)
    }
    
    func test_칸타타객체생성여부() {
        let cantataCoffee = Cantata(brand: "맥심", name: "칸타타카페모카", volume: 400, price: 3000, manufacturedDate: form.date(from: "20170110") ?? Date(), hot : true)
        XCTAssertNotNil(cantataCoffee)
    }
    
    func test_조지아생성여부() {
        let georgiaCoffee = Georgia(brand: "맥심", name: "조지아아메리카노", volume: 400, price: 3000, manufacturedDate: form.date(from: "20170110") ?? Date(), hot : true)
        XCTAssertNotNil(georgiaCoffee)
    }
    
    func test_커피객체공통메서드() {
        let coffee = Coffee(brand: "더벤티", name: "아이스아메리카노", volume: 500, price: 1500, manufacturedDate: form.date(from: "20170303") ?? Date(), hot: false)
        XCTAssertFalse(coffee.isHot())
    }

}
