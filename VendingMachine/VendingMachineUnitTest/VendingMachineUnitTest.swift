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
    var vendingMachineForTest: VendingMachine!

    override func setUp() {
        super.setUp()
        self.form = DateFormatter()
        form.dateFormat = "yyyyMMdd"
        let productsBox = [
            StrawberryMilk("서울우유", "날마다딸기우유", 200, 1000, form.date(from: "20180117") ?? Date()),
            BananaMilk("서울우유", "날마다바나나우유", 200, 1000, form.date(from: "20170117") ?? Date()),
            PepciCoke("코카콜라", "다이어트콜라", 350, 2000, form.date(from: "20170110") ?? Date(), lowCalorie: true),
            Fanta("환타", "환타오렌지", 350, 2000, form.date(from: "20170109") ?? Date(), lowCalorie: false),
            TOPCoffee("맥심", "TOP아메리카노", 400, 3000, form.date(from: "20170117") ?? Date(), hot: false),
            Georgia("맥심", "조지아카페모카", 450, 3500, form.date(from: "20170119") ?? Date(), hot: true)
            ]
        vendingMachineForTest = VendingMachine(productsBox: productsBox)
    }

    func test_딸기우유객체생성여부() {
        let strawberryMilk = StrawberryMilk("서울우유", "날마다딸기우유", 200, 1000, form.date(from: "20170117") ?? Date())
        XCTAssertNotNil(strawberryMilk)
    }

    func test_바나나우유객체생성여부() {
        let bananaMilk = BananaMilk("서울우유", "날마다바나나우유", 200, 1000, form.date(from: "20170116") ?? Date())
        XCTAssertNotNil(bananaMilk)
    }

    func test_초코우유객체생성및메서드() {
        let chocolateMilk = ChocolateMilk("서울우유", "날마다초코우유", 200, 1000, form.date(from: "20170115") ?? Date())
        XCTAssertNotNil(chocolateMilk)
    }

    func test_우유객체공통메서드() {
        let milk = Milk(brand: "매일우유", name: "키크는우유", volume: 200, price: 500,
                        manufacturedDate: form.date(from: "20170115") ?? Date())
        XCTAssertFalse(milk.validate(with: form.date(from: "20170131") ?? Date()))
        XCTAssertTrue(milk.validate(with: form.date(from: "20170106") ?? Date()))
    }

    func test_팹시콜라객체생성여부() {
        let pepsi = PepciCoke("팹시", "다이어트콜라", 350, 2000, form.date(from: "20170201") ?? Date(), lowCalorie: true)
        XCTAssertNotNil(pepsi)
    }

    func test_스프라이트객체생성여부() {
        let sprite = Sprite("코카콜라", "사이다", 350, 2000, form.date(from: "20170202") ?? Date(), lowCalorie: false)
        XCTAssertNotNil(sprite)
    }

    func test_환타객체생성여부() {
        let fanta = Fanta("환타", "환타오렌지", 350, 2000, form.date(from: "20170203") ?? Date(), lowCalorie: true)
        XCTAssertNotNil(fanta)
    }

    func test_탄산음료객체공통메서드() {
        let sodaPop = SodaPop(brand: "코카콜라", name: "제로콜라", volume: 200, price: 500,
                              manufacturedDate: form.date(from: "20170107") ?? Date(), lowCalorie: true)
        XCTAssertTrue(sodaPop.isLowCalorie())
    }

    func test_TOP커피객체생성여부() {
        let topCoffee = TOPCoffee("맥심", "TOP아메리카노", 400, 3000, form.date(from: "20170110") ?? Date(), hot: false)
        XCTAssertNotNil(topCoffee)
    }

    func test_칸타타객체생성여부() {
        let cantataCoffee = Cantata("맥심", "칸타타카페모카", 400, 3000, form.date(from: "20170110") ?? Date(), hot: true)
        XCTAssertNotNil(cantataCoffee)
    }

    func test_조지아생성여부() {
        let georgiaCoffee = Georgia("맥심", "조지아아메리카노", 400, 3000, form.date(from: "20170110") ?? Date(), hot: true)
        XCTAssertNotNil(georgiaCoffee)
    }

    func test_커피객체공통메서드() {
        let coffee = Coffee(brand: "더벤티", name: "아이스아메리카노", volume: 500, price: 1500,
                            manufacturedDate: form.date(from: "20170303") ?? Date(), hot: false)
        XCTAssertFalse(coffee.isHot())
    }

    func test_자판기객체생성여부() {
        let tempBox = [
            StrawberryMilk("서울우유", "날마다딸기우유", 200, 1000, form.date(from: "20180117") ?? Date()),
            BananaMilk("서울우유", "날마다바나나우유", 200, 1000, form.date(from: "20170117") ?? Date()),
            PepciCoke("코카콜라", "다이어트콜라", 350, 2000, form.date(from: "20170110") ?? Date(), lowCalorie: true),
            Fanta("환타", "환타오렌지", 350, 2000, form.date(from: "20170109") ?? Date(), lowCalorie: false),
            TOPCoffee("맥심", "TOP아메리카노", 400, 3000, form.date(from: "20170117") ?? Date(), hot: false),
            Georgia("맥심", "조지아카페모카", 450, 3500, form.date(from: "20170119") ?? Date(), hot: true)
            ]

        let vendingMachine = VendingMachine(productsBox: tempBox)
        XCTAssertNotNil(vendingMachine)
    }

    func test_자판기돈넣기메서드() {
        vendingMachineForTest.addMoney(1000)
        XCTAssertTrue(vendingMachineForTest.getBalance() == 1000)
    }

    func test_자판기음료객체추가메서드() {
        let baseCountOfStrawBerryMilk = vendingMachineForTest.generateCountOfProduct(
            ObjectIdentifier(type(of: StrawberryMilk())))
        let tempDrink = StrawberryMilk("서울우유", "날마다딸기우유", 200, 1000, form.date(from: "20180117") ?? Date())
        vendingMachineForTest.addBeverage(tempDrink)
        XCTAssertTrue(vendingMachineForTest.generateCountOfProduct(
            ObjectIdentifier(type(of: StrawberryMilk()))) == baseCountOfStrawBerryMilk + 1)
    }

    func test_자판기구매가능음료리스트메서드() {
        vendingMachineForTest.addMoney(10000)
        XCTAssertNotNil(vendingMachineForTest.generateListOfValidProduct())
        XCTAssertTrue(vendingMachineForTest.generateListOfValidProduct().count == 6)
    }

    func test_자판기음료구매메서드() {
        vendingMachineForTest.addMoney(10000)
        vendingMachineForTest.buy(StrawberryMilk())
        XCTAssertNil(vendingMachineForTest.addBeverage(StrawberryMilk()))
    }

    func test_자판기잔액확인메서드() {
        vendingMachineForTest.addMoney(10000)
        XCTAssertTrue(vendingMachineForTest.getBalance() == 10000)
    }

    func test_자판기유통기간지난우유리스트생성메서드() {
        XCTAssertNotNil(vendingMachineForTest.generateInvalidProducts())
        XCTAssertTrue(vendingMachineForTest.generateInvalidProducts().count == 1) //바나나우유
    }

    func test_자판기뜨거운커피우유리스트생성메서드() {
        XCTAssertNotNil(vendingMachineForTest.generateHotProducts())
        XCTAssertTrue(vendingMachineForTest.generateHotProducts().count == 1) //조지아
    }

    func test_자판기구매내역리스트생성메서드() {
        vendingMachineForTest.buy(StrawberryMilk())
        XCTAssertNotNil(vendingMachineForTest.generateListOfHistory())
        XCTAssertTrue(vendingMachineForTest.generateListOfHistory().count == 1) //딸기우유
    }

}
