//
//  VendingMachineIntegrationTest.swift
//  VendingMachineIntegrationTest
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest
@testable import VendingMachine

class VendingMachineIntegrationTest: XCTestCase {
    let orignalCoke = Coke(sugarContent: 40, volume: 250, price: 700, name: "CocaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let orignalCoke2 = Coke(sugarContent: 40, volume: 250, price: 700, name: "CocaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let sprite = Sprite(sugarContent: 0, volume: 200, price: 800, name: "스프라이트", manufacturingDate: "20171215", labelColor: "GREEN", forBusiness: false)
    let lightMilk = LightBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171210")
    let badLightMilk = LightBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171101")
    let starBucksCoffee = StarBucksCoffee(reserve: false, caffeine: true, temperature: 90, volume: 700, price: 2000, name: "스타벅스 커피", manufacturingDate: "20171217")
    // 시나리오1 : 통합테스트 모든 재고를 추가하고 1000원을 넣었을때, 구매 가능한 음료 반환 테스트
    //           잔액확인, 재고확인, 구매이력 확인
    func test통합테스트_시나리오1() {
        let stockBox = [orignalCoke, lightMilk, badLightMilk, starBucksCoffee]
        let beverageData = VendingMachineData(stock: stockBox)
        var adminMachine = AdminVendingMachine(with: beverageData)
        adminMachine.addBeverage(sprite)
        var userMachine = UserVendingMachine(with: beverageData)
        userMachine.insertMoney(1000)
        var validStock = userMachine.getValidBuyingBeverage()
        XCTAssertEqual(orignalCoke.description, validStock[0].description)
        XCTAssertEqual(sprite.description, validStock[1].description)
        _ = try? userMachine.buyBeverage(sprite)
        XCTAssertEqual(200, userMachine.getBalance())
        XCTAssertEqual(0, userMachine.getStockList()[sprite]!)
        XCTAssertEqual("Sprite", userMachine.getRecepit()[0])
    }
}
