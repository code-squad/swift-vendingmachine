//
//  SystemTestOfVendingMachine.swift
//  SystemTestOfVendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class SystemTestOfVendingMachine: XCTestCase {
    var controller = Controller()

    func test_AddMoney() {
        controller.add(money: 500)
        XCTAssertEqual(controller.userBalance(), 500)
    }

    func test_withdrawlBalance() {
        controller.add(money: 10000)
        controller.withdrawlBalance()
        XCTAssertEqual(controller.userBalance(), 0)
    }

    func test_Success_Add_Product() {
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180305", .second_Grade, 72, 0.7)
        controller.add(product: bananaFlavord)
        var list = controller.listOfInventory()
       XCTAssertEqual(list.count, 1)
    }

    func test_Fail_Add_Product() {
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180305", .second_Grade, 72, 0.7)
        let chocoFlavored = ChocoFlavoredMilk("신선한정훈", 250, 1500, "맛좋은초코우유", "20180307", .first_Grade, 62, 1.6)
        controller.add(product: chocoFlavored)
        controller.add(product: bananaFlavord)
        var list = controller.listOfInventory()
        XCTAssertNotEqual(list.count, 1)
    }

    func test_잔액이부족한경우_구매가능한리스트확인() {
        controller.add(money: 500)
        let welchs = Welchs("톡쏘는정훈", 200, 1500, "맛좋은웰취스", "20171001", 110, .strawberry)
        let coke = Coke("톡쏘는정훈", 250, 1000, "맛좋은코크", "20170907", 100, .original)
        controller.add(product: welchs)
        controller.add(product: coke)
        let shopping = controller.buyableBeverages()
        XCTAssertEqual(shopping.count, 0)
    }

    func test_잔액충분한데유통기한이지난경우_구매가능한리스트확인() {
        controller.add(money: 3500)
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20170305", .second_Grade, 72, 0.7)
        let chocoFlavored = ChocoFlavoredMilk("신선한정훈", 250, 1500, "맛좋은초코우유", "20170307", .first_Grade, 62, 1.6)
        controller.add(product: bananaFlavord)
        controller.add(product: chocoFlavored)
        let shopping = controller.buyableBeverages()
        XCTAssertEqual(shopping.count, 0)
    }

    func test_잔액충분_유통기한지나지않은경우_구매가능리스트확인() {
        controller.add(money: 3500)
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180301", .second_Grade, 72, 0.7)
        let chocoFlavored = ChocoFlavoredMilk("신선한정훈", 250, 1500, "맛좋은초코우유", "20180301", .first_Grade, 62, 1.6)
        controller.add(product: bananaFlavord)
        controller.add(product: chocoFlavored)
        let shopping = controller.buyableBeverages()
        XCTAssertEqual(shopping.count, 2)
    }

    func test_구매성공여부확인() {
        controller.add(money: 3500)
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180301", .second_Grade, 72, 0.7)
        controller.add(product: bananaFlavord)
        let beverage = controller.buy(productIndex: 1)!
        XCTAssertEqual(beverage, bananaFlavord)
    }

    func test_구매실패여부확인_없는상품_구매하려고할때() {
        controller.add(money: 3500)
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180301", .second_Grade, 72, 0.7)
        let chocoFlavored = ChocoFlavoredMilk("신선한정훈", 250, 1500, "맛좋은초코우유", "20180301", .first_Grade, 62, 1.6)
        controller.add(product: chocoFlavored)
        let beverage = controller.buy(productIndex: 1)!
        XCTAssertNotEqual(beverage, bananaFlavord)
    }

    func test_유통기한만료된음료만_리스트_정상확인되는지_확인() {
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20160301", .second_Grade, 72, 0.7)
        let chocoFlavored = ChocoFlavoredMilk("신선한정훈", 250, 1500, "맛좋은초코우유", "20160301", .first_Grade, 62, 1.6)
        let welchs = Welchs("톡쏘는정훈", 200, 1500, "맛좋은웰취스", "20171001", 110, .strawberry)
        controller.add(product: bananaFlavord)
        controller.add(product: chocoFlavored)
        controller.add(product: welchs)
        let list = controller.checkListOfOverExpirationDate()
        XCTAssertEqual(list, [bananaFlavord, chocoFlavored])
    }

    func test_구매이력_정상확인되는지_여부() {
        controller.add(money: 3500)
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180301", .second_Grade, 72, 0.7)
        controller.add(product: bananaFlavord)
        let beverage = controller.buy(productIndex: 1)!
        let history = controller.shoppingHistory()
        XCTAssertEqual(beverage, history[0].key)
    }

    func test_자판기_정상작동여부_통합테스트() {
        var welchs = Welchs("톡쏘는정훈", 400, 1500, "웰치스", "20171105", 40, .grape)
        var chocoFlavoredMilk = ChocoFlavoredMilk("달콤한정훈", 250, 1700, "맛좋은초코유유", "20180301", .second_Grade, 200, 1)
        var top = Top("분위기있는정훈", 200, 1500, "TOP", "20171225", .grande, .basic)
        var dutchCoffeeStory = DutchCoffeeStory("분위기있는정훈", 300, 3000, "더치커피스토리", "20171005", .short, .forGiftUse)
        let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20160301", .second_Grade, 72, 0.7)
        var beverages: [Beverage] = [chocoFlavoredMilk, top, dutchCoffeeStory, welchs, bananaFlavord]
        beverages.forEach {
            controller.add(product: $0)
        }
        XCTAssertEqual(controller.listOfInventory().count, 5)
        controller.add(money: 10000)
        XCTAssertEqual(controller.userBalance(), 10000)
        let buyableBeverage = controller.buyableBeverages()
        XCTAssertEqual(buyableBeverage.count, 4)
        let purchasedBeverage = controller.buy(welchs)
        XCTAssertEqual(controller.userBalance(), 8500)
        XCTAssertEqual(controller.shoppingHistory()[0].key, purchasedBeverage)
        controller.withdrawlBalance()
        XCTAssertEqual(controller.userBalance(), 0)
    }

}
