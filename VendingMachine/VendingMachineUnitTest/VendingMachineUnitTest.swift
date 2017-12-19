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
        let beverageData = VendingMachineData(stock: emptyStock)
        var vendingMachine = UserVendingMachine(with: beverageData)
        vendingMachine.insertMoney(1000)
        XCTAssertEqual(1000,vendingMachine.getBalance())
    }
    
    func test음료수재고추가() {
        let beverageData = VendingMachineData(stock: emptyStock)
        var vendingMachine = AdminVendingMachine(with: beverageData)
        vendingMachine.addBeverage(orignalCoke)
    }
    
    func test구매가능목록_한개일때() {
        let beverageData = VendingMachineData(stock: [orignalCoke])
        var vendingMachine = UserVendingMachine(with: beverageData)
        vendingMachine.insertMoney(1000)
        let beverage = vendingMachine.getValidBuyingBeverage()
        XCTAssertEqual(orignalCoke, beverage[0])
    }

    func test구매가능목록_1개일때_재고가2개일때() {
        let beverageData = VendingMachineData(stock: [orignalCoke, orignalCoke2])
        var vendingMachine = UserVendingMachine(with: beverageData)
        vendingMachine.insertMoney(1000)
        XCTAssertEqual(1, vendingMachine.getValidBuyingBeverage().count)
        let beverage = vendingMachine.getValidBuyingBeverage()
        XCTAssertEqual(orignalCoke, beverage[0])
    }
    
    func test상품을구매할때() {
        let beverageData = VendingMachineData(stock: [orignalCoke])
        var vendingMachine = UserVendingMachine(with: beverageData)
        vendingMachine.insertMoney(1000)
        XCTAssertEqual(orignalCoke, try! vendingMachine.buyBeverage(orignalCoke))
    }
    
    func test상품을구매할때_재고확인() {
        let beverageData = VendingMachineData(stock: [orignalCoke])
        var vendingMachine = UserVendingMachine(with: beverageData)
        vendingMachine.insertMoney(1000)
        _ = try! vendingMachine.buyBeverage(orignalCoke)
        XCTAssertEqual(0, vendingMachine.getStockList()[orignalCoke])
    }
    
    func test상품을구매할때_재고가없을때() {
        let beverageData = VendingMachineData(stock: emptyStock)
        var vendingMachine = UserVendingMachine(with: beverageData)
        XCTAssertThrowsError(try vendingMachine.buyBeverage(lightMilk)) { (error) -> Void in
            XCTAssertEqual(error as? ErrorCode, ErrorCode.noStock)
        }
    }
    
    func test상품을구매할때_잔액이부족할때() {
        let beverageData = VendingMachineData(stock: [orignalCoke])
        var vendingMachine = UserVendingMachine(with: beverageData)
        XCTAssertThrowsError(try vendingMachine.buyBeverage(orignalCoke)) { (error) -> Void in
            XCTAssertEqual(error as? ErrorCode, ErrorCode.noMoney)
        }
    }
    
    func test재고의_종류갯수_출력() {
        let beverageData = VendingMachineData(stock: [orignalCoke, lightMilk, lightMilk])
        let vendingMachine = UserVendingMachine(with: beverageData)
        XCTAssertEqual(2, vendingMachine.getStockList().keys.count)
    }
    
    func test재고의종류에따른_갯수() {
        let beverageData = VendingMachineData(stock: [orignalCoke, lightMilk, lightMilk])
        let vendingMachine = UserVendingMachine(with: beverageData)
        let stock = vendingMachine.getStockList()
        XCTAssertEqual(2, stock.count)
        XCTAssertEqual(1, stock[orignalCoke])
        XCTAssertEqual(2, stock[lightMilk])
    }
    
    func test유통기한지난_재고확인() {
        let beverageData = VendingMachineData(stock: [badLightMilk, orignalCoke])
        let vendingMachine = AdminVendingMachine(with: beverageData)
        let beverage = vendingMachine.getPassedValidateBeverage()[0]
        XCTAssertEqual(1, vendingMachine.getPassedValidateBeverage().count)
        XCTAssertEqual(false, beverage.validate(with: Date()))
    }
    
    func test뜨거운음료확인() {
        let beverageBox = [orignalCoke, orignalCoke2, lightMilk, badLightMilk, starBucksCoffee]
        let beverageData = VendingMachineData(stock: beverageBox)
        let vendingMachine = UserVendingMachine(with: beverageData)
        XCTAssertEqual(1, vendingMachine.getHotBeverage().count)
    }
    
    func test영수증_출력() {
        let beverageBox = [orignalCoke, orignalCoke2, lightMilk, badLightMilk, starBucksCoffee]
        let beverageData = VendingMachineData(stock: beverageBox)
        var vendingMachine = UserVendingMachine(with: beverageData)
        vendingMachine.insertMoney(1000)
        _ = try! vendingMachine.buyBeverage(orignalCoke)
        XCTAssertEqual(1, vendingMachine.getRecepit().count)
    }
    
}
