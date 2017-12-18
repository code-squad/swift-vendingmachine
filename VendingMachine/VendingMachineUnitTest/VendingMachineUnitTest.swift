//
//  VendingMachineUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by Mrlee on 2017. 12. 15..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest

class VendingMachineUnitTest: XCTestCase {
    let emptyStock = [Beverage]()
    let orignalCoke = Coke(sugarContent: 40, volume: 250, price: 700, name: "CocaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let orignalCoke2 = Coke(sugarContent: 40, volume: 250, price: 700, name: "CocaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let lightMilk = LightBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171210")
    let badLightMilk = LightBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171101")
    let starBucksCoffee = StarBucksCoffee(reserve: false, caffeine: true, temperature: 90, volume: 700, price: 2000, name: "스타벅스 커피", manufacturingDate: "20171217")
    
    func test자판기금액올리기() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.insertMoney(1000)
        XCTAssertEqual(1000,vendingMachine.getBalance())
    }
    
    func test음료수재고추가() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
    }
    
    func test구매가능목록_한개일때() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
        vendingMachine.insertMoney(1000)
        let beverage = vendingMachine.getValidBuyingBeverage()
        XCTAssertEqual(orignalCoke, beverage[0])
    }

    func test구매가능목록_1개일때_재고가2개일때() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
        vendingMachine.addBeverage(orignalCoke2)
        vendingMachine.insertMoney(1000)
        XCTAssertEqual(1, vendingMachine.getValidBuyingBeverage().count)
        let beverage = vendingMachine.getValidBuyingBeverage()
        XCTAssertEqual(orignalCoke, beverage[0])
    }
    
    func test상품을구매할때() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
        vendingMachine.insertMoney(1000)
        XCTAssertEqual(orignalCoke, try! vendingMachine.buyBeverage(orignalCoke))
    }
    
    func test상품을구매할때_재고확인() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
        vendingMachine.insertMoney(1000)
        _ = try! vendingMachine.buyBeverage(orignalCoke)
        XCTAssertEqual(0, vendingMachine.stock.count)
    }
    
    func test상품을구매할때_재고가없을때() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        XCTAssertThrowsError(try vendingMachine.buyBeverage(lightMilk)) { (error) -> Void in
            XCTAssertEqual(error as? ErrorCode, ErrorCode.noStock)
        }
    }
    
    func test상품을구매할때_잔액이부족할때() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
        XCTAssertThrowsError(try vendingMachine.buyBeverage(orignalCoke)) { (error) -> Void in
            XCTAssertEqual(error as? ErrorCode, ErrorCode.noMoney)
        }
    }
    
    func test재고의_종류갯수_출력() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
        vendingMachine.addBeverage(lightMilk)
        vendingMachine.addBeverage(lightMilk)
        XCTAssertEqual(2, vendingMachine.getStockList().keys.count)
    }
    
    func test재고의종류에따른_갯수() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(orignalCoke)
        vendingMachine.addBeverage(lightMilk)
        vendingMachine.addBeverage(lightMilk)
        let stock = vendingMachine.getStockList()
        XCTAssertEqual(2, stock.count)
        XCTAssertEqual(1, stock[orignalCoke])
        XCTAssertEqual(2, stock[lightMilk])
    }
    
    func test유통기한지난_재고확인() {
        var vendingMachine = VendingMachine(stock: emptyStock)
        vendingMachine.addBeverage(badLightMilk)
        vendingMachine.addBeverage(orignalCoke)
        let beverage = vendingMachine.getPassedValidateBeverage()[0]
        XCTAssertEqual(1, vendingMachine.getPassedValidateBeverage().count)
        XCTAssertEqual(false, beverage.validate(with: Date()))
    }
    
    func test뜨거운음료확인() {
        let beverageBox = [orignalCoke, orignalCoke2, lightMilk, badLightMilk, starBucksCoffee]
        let vendingMachine = VendingMachine(stock: beverageBox)
        XCTAssertEqual(1, vendingMachine.getHotBeverage().count)
    }
    
    func test영수증_출력() {
        let box = [orignalCoke, orignalCoke2, lightMilk, badLightMilk, starBucksCoffee]
        var vendingMachine = VendingMachine(stock: box)
        vendingMachine.addBeverage(orignalCoke)
        vendingMachine.insertMoney(1000)
        _ = try! vendingMachine.buyBeverage(orignalCoke)
        XCTAssertEqual(1, vendingMachine.getRecepit().count)
    }
}
