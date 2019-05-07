//
//  VendingMachineUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by Elena on 26/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class VendingMachineUnitTest: XCTestCase {
    // Date로 String을 변경해서 나온 값과 동일한지 체크
    func test_Date_String_변경하는_함수_테스트_성공() {
        let nowDate = Date.changeString(beforeString: "20190101")
        let nowString = Date.changeDate(beforeDate: nowDate)

        XCTAssertTrue(nowString == "20190101")
    }

    // Date로 String을 변경해서 나온 값이 다른지 체크
    func test_Date_String_변경하는_함수_테스트_실패() {
        let nowString = Date.changeDate(beforeDate: Date())
        XCTAssertFalse(nowString == "20190101")
    }

    // String에서 Date로 변경해서 Date가 같은지 확인하기 하기
    func test_String_Date_변경하는_함수_테스트_성공() {
        let nowString = Date.changeDate(beforeDate: Date())
        let nowDate = Date.changeString(beforeString: nowString)

        XCTAssertTrue(Date.isEqualDate(manufacturedDate: nowDate))
    }

    // 5일뒤 날짜 확인하기
    func test_Date_5일이후_날짜_확인() {
        let nowDate = Date.changeString(beforeString: "20190101")
        let afterDate = Date.addDate(addDay: 5, day: nowDate)
        let endDate = Date.changeString(beforeString: "20190106")

        XCTAssertTrue(afterDate == endDate)
    }

    // description 값이 들어가는지 체크
    func test_check_Description() {
        let starbucksCoffee = StarbucksCoffee()

        XCTAssertNotNil(starbucksCoffee)
    }

    // -----------------------
    // 자판기 작동 확인 테스트 코드
    // -----------------------

    private var vendingMachine: VendingMachine!

    override func setUp() {
        let emptyList = Inventory(list: [:])
        self.vendingMachine = VendingMachine(list: emptyList)
    }

    func test_vendingMachine_비어있는_리스트일경우_체크() {
        XCTAssertTrue(vendingMachine.isEmpty())
    }

    func test_vendingMachine_그럴일은_없지만_음수가_들어온다면_거짓() {
        let counterfeitMoney = -500
        XCTAssertFalse(vendingMachine.isPut(cash: counterfeitMoney))
    }

    func test_vendingMachine_돈을_넣지않아서_이용할수_없다() {
        let beverages = [CocaCola(), Sprite(), BananaMilk()]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}
        XCTAssertTrue(vendingMachine.buyAvailableList().isEmpty)
    }

    func test_vendingMachine_콜라를_뽑아먹어보자_성공() {
        let beverages = CocaCola()
        vendingMachine.add(beverage: beverages)
        _ = vendingMachine.isPut(cash: 1500)
        XCTAssertNotNil(vendingMachine.buyAvailableList().first)
    }

    func test_vendingMachine_콜라를_뽑아먹어보자_실패_돈이부족해서() {
        let beverages = CocaCola()
        vendingMachine.add(beverage: beverages)
        _ = vendingMachine.isPut(cash: 1000)
        XCTAssertNil(vendingMachine.buyAvailableList().first)
    }

    func test_vendingMachine_돈은1500원투입_먹고싶은걸_사먹는다() {
        let coca = CocaCola(), sprite = Sprite(),
        cantata = CantataCoffee(),
        star = StarbucksCoffee(), chocolateM = ChocolateMilk()
        let beverages = [coca, sprite, cantata, star, chocolateM]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}

        _ = vendingMachine.isPut(cash: 1500)

        let list = vendingMachine.buyAvailableList()
        let beverageBuy = vendingMachine.buyBeverage(package: list.randomElement()!)
        let beveragesBuyable: [Beverage] = [coca, sprite, chocolateM]
        XCTAssertTrue(beveragesBuyable.contains(beverageBuy!))
    }

    func test_vendingMachine_돈은1500원투입_먹고싶은건_비싸서_못사먹는다() {
        let coca = CocaCola(), sprite = Sprite(),
        cantata = CantataCoffee(),
        star = StarbucksCoffee(), chocolateM = ChocolateMilk()
        let beverages = [coca, sprite, cantata, star, chocolateM]
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage)}

        _ = vendingMachine.isPut(cash: 1500)

        let list = vendingMachine.buyAvailableList()
        let beverageBuy = vendingMachine.buyBeverage(package: list.randomElement()!)
        let beveragesNotBuyable: [Beverage] = [cantata, star]
        XCTAssertFalse(beveragesNotBuyable.contains(beverageBuy!))
    }

}
