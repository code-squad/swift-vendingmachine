//
//  UnitTestVendingMachine.swift
//  UnitTestBeverage
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {

    var VM: VendingMachine!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        VM = VendingMachine()
        
        let mandarineMilk = MandarineMilk()
        let lactoseFreeMilk = LactoseFreeMilk()
        let starbucksDoubleShot = StarbucksDoubleShot()
        let topTheBlack = TOPTheBlack()
        let cocaCola = CocaCola()
        let cocaColaZero = CocaColaZero()
        
        VM.add(product: mandarineMilk)
        VM.add(product: lactoseFreeMilk)
        VM.add(product: lactoseFreeMilk)
        VM.add(product: cocaCola)
        VM.add(product: cocaCola)
        VM.add(product: cocaCola)
        VM.add(product: starbucksDoubleShot)
        VM.add(product: starbucksDoubleShot)
        VM.add(product: topTheBlack)
        VM.add(product: cocaColaZero)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuyableProducts1100() {
        VM.insert(money: 1100)
        XCTAssertEqual(VM.buyableProductList().count, 1)
    }
    
    func testBuyableProducts1200() {
        VM.insert(money: 1200)
        XCTAssertEqual(VM.buyableProductList().count, 2)
    }
    
    func testBuyableProducts1400() {
        VM.insert(money: 1400)
        XCTAssertEqual(VM.buyableProductList().count, 5)
    }

    func testBuyCocaCola() {
        XCTAssertTrue(VM.buy(productName: "CocaCola") is CocaCola)
    }
    
    func testBuyMandarineMilk() {
        XCTAssertTrue(VM.buy(productName: "MandarineMilk") is MandarineMilk)
    }
    
    func testCheckBalance1100() {
        VM.insert(money: 1100)
        XCTAssertEqual(VM.checkBalance(), "1,100")
    }
    
    func testCheckBalance2000() {
        VM.insert(money: 2000)
        XCTAssertEqual(VM.checkBalance(), "2,000")
    }
    
    func testCheckInventory() {
        XCTAssertEqual(VM.checkInventory(), ["귤맛우유": 1,
                                             "소화가잘되는우유": 2,
                                             "스타벅스더블샷에스프레소&크림": 2,
                                             "맥심티오피더블랙": 1,
                                             "코카콜라": 3,
                                             "코카콜라제로": 1])
    }
    
    func testCheckAddedInventory() {
        let cocaCola = CocaCola()
        let starbucksDoubleShot = StarbucksDoubleShot()
        
        VM.add(product: cocaCola)
        VM.add(product: cocaCola)
        VM.add(product: cocaCola)
        VM.add(product: starbucksDoubleShot)
        VM.add(product: starbucksDoubleShot)
        
        XCTAssertEqual(VM.checkInventory(), ["귤맛우유": 1,
                                             "소화가잘되는우유": 2,
                                             "스타벅스더블샷에스프레소&크림": 4,
                                             "맥심티오피더블랙": 1,
                                             "코카콜라": 6,
                                             "코카콜라제로": 1])
    }
    
    func testHotProducts() {
        XCTAssertEqual(VM.hotProducts().count, 1)
    }
    
    func testHotBoughtProducts() {
        let _ = VM.buy(productName: "StarbucksDoubleShot")
        let _ = VM.buy(productName: "StarbucksDoubleShot")
        XCTAssertEqual(VM.hotProducts().count, 0)
    }
    
    func testCombineScenario() {
        VM.insert(money: 10000)
        let _ = VM.buy(productName: "CocaCola")
        let _ = VM.buy(productName: "CocaCola")
        let _ = VM.buy(productName: "CocaCola")
        let _ = VM.buy(productName: "StarbucksDoubleShot")
        let _ = VM.buy(productName: "StarbucksDoubleShot")
        let _ = VM.buy(productName: "CocaCola")
        
        XCTAssertEqual(VM.checkBalance(), "3,300")
        XCTAssertEqual(VM.buyableProductList().count, 4)
        
        VM.insert(money: 1700)
        XCTAssertEqual(VM.checkBalance(), "5,000")
        
        VM.add(product: CocaCola())
        VM.add(product: CocaCola())
        VM.add(product: CocaCola())
        VM.add(product: StarbucksDoubleShot())
        XCTAssertEqual(VM.buyableProductList().count, VM.checkInventory().count)
        
        let _ = VM.buy(productName: "CocaCola")
        let _ = VM.buy(productName: "CocaCola")
        let _ = VM.buy(productName: "CocaCola")
        XCTAssertEqual(VM.checkBalance(), "1,100")
        XCTAssertEqual(VM.buyableProductList().count, 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
