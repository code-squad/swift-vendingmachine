//
//  UnitTestVendingMachine.swift
//  UnitTestBeverage
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {

    var vendingMachine: VendingMachine!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        vendingMachine = VendingMachine()

        let mandarineMilk = MandarineMilk()
        let lactoseFreeMilk = LactoseFreeMilk()
        let starbucksDoubleShot = StarbucksDoubleShot()
        let topTheBlack = TOPTheBlack()
        let cocaCola = CocaCola()
        let cocaColaZero = CocaColaZero()

        vendingMachine.add(product: mandarineMilk)
        vendingMachine.add(product: lactoseFreeMilk)
        vendingMachine.add(product: lactoseFreeMilk)
        vendingMachine.add(product: cocaCola)
        vendingMachine.add(product: cocaCola)
        vendingMachine.add(product: cocaCola)
        vendingMachine.add(product: starbucksDoubleShot)
        vendingMachine.add(product: starbucksDoubleShot)
        vendingMachine.add(product: topTheBlack)
        vendingMachine.add(product: cocaColaZero)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuyableProducts1100() {
        vendingMachine.insert(money: 1100)
        XCTAssertEqual(vendingMachine.buyableProductList().count, 1)
    }

    func testBuyableProducts1200() {
        vendingMachine.insert(money: 1200)
        XCTAssertEqual(vendingMachine.buyableProductList().count, 2)
    }

    func testBuyableProducts1400() {
        vendingMachine.insert(money: 1400)
        XCTAssertEqual(vendingMachine.buyableProductList().count, 5)
    }

    func testBuyCocaCola() {
        XCTAssertTrue(vendingMachine.buy(productName: "CocaCola") is CocaCola)
    }

    func testBuyMandarineMilk() {
        XCTAssertTrue(vendingMachine.buy(productName: "MandarineMilk") is MandarineMilk)
    }

    func testCheckBalance1100() {
        vendingMachine.insert(money: 1100)
        XCTAssertEqual(vendingMachine.checkBalance(), "1,100")
    }

    func testCheckBalance2000() {
        vendingMachine.insert(money: 2000)
        XCTAssertEqual(vendingMachine.checkBalance(), "2,000")
    }

    func testCheckInventory() {
        XCTAssertEqual(vendingMachine.checkInventory(), ["귤맛우유": 1,
                                             "소화가잘되는우유": 2,
                                             "스타벅스더블샷에스프레소&크림": 2,
                                             "맥심티오피더블랙": 1,
                                             "코카콜라": 3,
                                             "코카콜라제로": 1])
    }

    func testCheckAddedInventory() {
        let cocaCola = CocaCola()
        let starbucksDoubleShot = StarbucksDoubleShot()

        vendingMachine.add(product: cocaCola)
        vendingMachine.add(product: cocaCola)
        vendingMachine.add(product: cocaCola)
        vendingMachine.add(product: starbucksDoubleShot)
        vendingMachine.add(product: starbucksDoubleShot)

        XCTAssertEqual(vendingMachine.checkInventory(), ["귤맛우유": 1,
                                             "소화가잘되는우유": 2,
                                             "스타벅스더블샷에스프레소&크림": 4,
                                             "맥심티오피더블랙": 1,
                                             "코카콜라": 6,
                                             "코카콜라제로": 1])
    }

    func testHotProducts() {
        XCTAssertEqual(vendingMachine.hotProducts().count, 1)
    }

    func testHotBoughtProducts() {
        _ = vendingMachine.buy(productName: "StarbucksDoubleShot")
        _ = vendingMachine.buy(productName: "StarbucksDoubleShot")
        XCTAssertEqual(vendingMachine.hotProducts().count, 0)
    }

    func testCombineScenario() {
        vendingMachine.insert(money: 10000)
        _ = vendingMachine.buy(productName: "CocaCola")
        _ = vendingMachine.buy(productName: "CocaCola")
        _ = vendingMachine.buy(productName: "CocaCola")
        _ = vendingMachine.buy(productName: "StarbucksDoubleShot")
        _ = vendingMachine.buy(productName: "StarbucksDoubleShot")
        _ = vendingMachine.buy(productName: "CocaCola")

        XCTAssertEqual(vendingMachine.checkBalance(), "3,300")
        XCTAssertEqual(vendingMachine.buyableProductList().count, 4)

        vendingMachine.insert(money: 1700)
        XCTAssertEqual(vendingMachine.checkBalance(), "5,000")

        vendingMachine.add(product: CocaCola())
        vendingMachine.add(product: CocaCola())
        vendingMachine.add(product: CocaCola())
        vendingMachine.add(product: StarbucksDoubleShot())
        XCTAssertEqual(vendingMachine.buyableProductList().count, vendingMachine.checkInventory().count)

        _ = vendingMachine.buy(productName: "CocaCola")
        _ = vendingMachine.buy(productName: "CocaCola")
        _ = vendingMachine.buy(productName: "CocaCola")
        XCTAssertEqual(vendingMachine.checkBalance(), "1,100")
        XCTAssertEqual(vendingMachine.buyableProductList().count, 1)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
