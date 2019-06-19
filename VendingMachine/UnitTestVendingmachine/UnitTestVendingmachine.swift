//
//  UnitTestVendingmachine.swift
//  UnitTestVendingmachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingmachine: XCTestCase {
    var top: TOP!
    var topHot: TOP!
    var strawberryMilk: StrawberryMilk!
    var bananaMilk: BananaMilk!
    var fanta: Fanta!
    var hot6: Hot6!
    var pepsiCoke: PepsiCoke!
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false, expirationDate: "20190615")
        topHot = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190608", hot: true, expirationDate: "20190630")
        strawberryMilk = StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3, expirationDate: "20190505")
        bananaMilk = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5, expirationDate: "20190405")
        fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505", orangeIncense: 0.3, expirationDate: "20190924")
        hot6 = Hot6(brand: "롯데", ml: 240, price: 1000, productDate: "20190529", expirationDate: "20191029")
        pepsiCoke = PepsiCoke(brand: "펩시", ml: 255, price: 1200, productDate: "20190610", expirationDate: "20191010")
        vendingMachine = VendingMachine()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeIsHot() {
        XCTAssertFalse(top.isHot())
        XCTAssertTrue(topHot.isHot())
    }
    
    func testMilkIsFarmCode() {
        XCTAssertFalse(strawberryMilk.isFarmCode(5))
        XCTAssertTrue(strawberryMilk.isFarmCode(3))
        XCTAssertFalse(bananaMilk.isFarmCode(3))
        XCTAssertTrue(bananaMilk.isFarmCode(5))
    }

    func testSparklingIsLawCalorie() {
        XCTAssertFalse(fanta.isLowCalorie())
    }
    
    func testExpirationDateValidate() {
        XCTAssertFalse(top.validate(with: "20190619"))
        XCTAssertTrue(topHot.validate(with: "20190619"))
        XCTAssertFalse(strawberryMilk.validate(with: "20190619"))
        XCTAssertFalse(bananaMilk.validate(with: "20190619"))
        XCTAssertTrue(fanta.validate(with: "20190619"))
    }
    
    func testFantaIsOrangeIncense() {
        XCTAssertTrue(fanta.isOrangeIncense(0.3))
        XCTAssertFalse(fanta.isOrangeIncense(0.5))
    }
    
    func testTOPIsTopLevelCoffeebeanContainPercent () {
        XCTAssertTrue(top.isTopLevelCoffeebeanContainPercent(0.5))
        XCTAssertFalse(top.isTopLevelCoffeebeanContainPercent(0.3))
    }
    
    func testBananaMilkIsLessthanbananaContainPercent () {
        XCTAssertTrue(bananaMilk.isLessthanBananaContainPercent(0.5))
        XCTAssertFalse(bananaMilk.isLessthanBananaContainPercent(0.2))
    }
    
    func testStrawberryMilkIsLessthanbananaContainPercent () {
        XCTAssertTrue(strawberryMilk.isLessthanStrawberryContainPercent(0.5))
        XCTAssertFalse(strawberryMilk.isLessthanStrawberryContainPercent(0.4))
    }
    
    func testInsertCoint () {
        XCTAssertEqual(vendingMachine.getBalance(), 0)
        vendingMachine.insertCoint(500)
        XCTAssertEqual(vendingMachine.getBalance(), 500)
        vendingMachine.insertCoint(1000)
        XCTAssertEqual(vendingMachine.getBalance(), 1500)
    }
    
    func testGetStockList () {
        let milkAmount = 20
        let fantaAmount = 10
        let topAmount = 40
        let hot6Amount = 6
        let pepsiCokeAmount = 30
        
        let stockListCompared = [bananaMilk: milkAmount, strawberryMilk: milkAmount, fanta: fantaAmount, top: topAmount, hot6: hot6Amount, pepsiCoke: pepsiCokeAmount]
        
        XCTAssertNotEqual(vendingMachine.getStockList(), stockListCompared)
        
        vendingMachine.supply(bananaMilk, amount: milkAmount)
        vendingMachine.supply(strawberryMilk, amount: milkAmount)
        
        XCTAssertEqual(vendingMachine.getStockList(), [bananaMilk: milkAmount, strawberryMilk: milkAmount])
        XCTAssertNotEqual(vendingMachine.getStockList(), stockListCompared)
        
        vendingMachine.supply(fanta, amount: fantaAmount)
        vendingMachine.supply(top, amount: topAmount)
        vendingMachine.supply(hot6, amount: hot6Amount)
        vendingMachine.supply(pepsiCoke, amount: pepsiCokeAmount)
    
        XCTAssertEqual(vendingMachine.getStockList(), stockListCompared)
    }
    
    func testGetBuyableDrinkList () {
        XCTAssertEqual(vendingMachine.getBuyableDrinkList(), [])
        
        vendingMachine.insertCoint(1300)
        
        XCTAssertEqual(vendingMachine.getBuyableDrinkList(), [])
        
        vendingMachine.supply(bananaMilk, amount: 20)
        vendingMachine.supply(strawberryMilk, amount: 20)
        
        XCTAssertEqual(vendingMachine.getBuyableDrinkList(), [bananaMilk, strawberryMilk])
        
        vendingMachine.supply(fanta, amount: 10)
        vendingMachine.supply(top, amount: 40)
        vendingMachine.supply(hot6, amount: 6)
        vendingMachine.supply(pepsiCoke, amount: 30)
        
        XCTAssertEqual(vendingMachine.getBuyableDrinkList(), [bananaMilk, strawberryMilk, hot6, pepsiCoke])
        
        vendingMachine.insertCoint(800)
        
        XCTAssertEqual(vendingMachine.getBuyableDrinkList(), [bananaMilk, strawberryMilk, fanta, hot6, pepsiCoke])
        
         vendingMachine.insertCoint(1000)

        XCTAssertEqual(vendingMachine.getBuyableDrinkList(), [bananaMilk, strawberryMilk, fanta, top, hot6, pepsiCoke])
    }
    
    func testBuy () {
        XCTAssertThrowsError(try vendingMachine.buy(bananaMilk))
        
        vendingMachine.supply(bananaMilk, amount: 20)
        vendingMachine.supply(strawberryMilk, amount: 20)
        
        XCTAssertThrowsError(try vendingMachine.buy(bananaMilk))
        
        vendingMachine.insertCoint(2000)
        
        XCTAssertEqual(vendingMachine.getStockList(), [bananaMilk: 20, strawberryMilk: 20])
        
        XCTAssertNoThrow(try vendingMachine.buy(bananaMilk))
        
        XCTAssertEqual(vendingMachine.getStockList(), [bananaMilk: 19, strawberryMilk: 20])
    }
    
    func testGetBalance () {
        vendingMachine.supply(bananaMilk, amount: 20)
        vendingMachine.supply(strawberryMilk, amount: 20)
        
        XCTAssertEqual(vendingMachine.getBalance(), 0)
        
        vendingMachine.insertCoint(2000)
        XCTAssertEqual(vendingMachine.getBalance(), 2000)
        
        XCTAssertNoThrow(try vendingMachine.buy(bananaMilk))
        XCTAssertEqual(vendingMachine.getBalance(), 700)
    }
    
    func testGetExpiredDrinkList () {
        vendingMachine.supply(bananaMilk, amount: 20)
        vendingMachine.supply(strawberryMilk, amount: 20)
        vendingMachine.supply(pepsiCoke, amount: 30)
        
        XCTAssertEqual(vendingMachine.getExpiredDrinkList() , [bananaMilk, strawberryMilk])
    }
    
    func testGetHotDrinkList () {
        vendingMachine.supply(top, amount: 20)
        vendingMachine.supply(topHot, amount: 20)
        
        XCTAssertEqual(vendingMachine.getHotDrinkList() , [topHot])
    }
    
    func testGetSellList () {
        vendingMachine.supply(top, amount: 20)
        vendingMachine.supply(topHot, amount: 20)
        vendingMachine.supply(bananaMilk, amount: 20)
        
        vendingMachine.insertCoint(10000)
        
        XCTAssertNoThrow(try vendingMachine.buy(topHot))
        XCTAssertNoThrow(try vendingMachine.buy(topHot))
        
        XCTAssertEqual(vendingMachine.getSellList(), [topHot,topHot])
        
        XCTAssertNoThrow(try vendingMachine.buy(bananaMilk))
        XCTAssertEqual(vendingMachine.getSellList(), [topHot,topHot,bananaMilk])
    }
}
