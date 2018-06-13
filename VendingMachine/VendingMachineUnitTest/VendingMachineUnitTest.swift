//
//  VendingMachineUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class VendingMachineUnitTest: XCTestCase {
    
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        let emptyStockManager = StockManager(stock: [:])
        self.vendingMachine = VendingMachine(stockManager: emptyStockManager)
    }
    
    func testVendingMachineInstantiate() {
        let vendingMachine: VendingMachine = self.vendingMachine
        XCTAssertNotNil(vendingMachine)
    }
    
    func testReadBalance() {
        XCTAssertEqual(vendingMachine.readBalance(), "0원")
    }
    
    func testInsertMoney() {
        vendingMachine.insertMoney(1000)
        let balance = vendingMachine.readBalance()
        XCTAssertEqual(balance, "1000원")
    }
    
    func testProductsAppendBeverage() {
        let coke = Coke()
        var products = Products(beverages: [])
        products.append(coke)
        let expectedProducts = Products(beverages: [coke])
        XCTAssertEqual(products, expectedProducts)
    }
    
    func testProductsAppendMultipleBeverage() {
        let cantata = Cantata()
        let sprite = Sprite()
        var products = Products(beverages: [])
        products.append(cantata)
        products.append(sprite)
        let expectedProducts = Products(beverages: [cantata, sprite])
        XCTAssertEqual(products, expectedProducts)
    }
    
    func testStockManagerAddBeverage() {
        let chocoMilk = ChocoMilk()
        let chocoMilkType = chocoMilk.productType ?? ProductType.ChocoMilk
        let products = Products(beverages: [chocoMilk])
        var stockManager = StockManager(stock: [:])
        stockManager.add(beverage: chocoMilk)
        let expected = StockManager(stock: [chocoMilkType:products])
        XCTAssertEqual(stockManager, expected)
    }
    
    func testVendingMachineAddBeverage() {
        let top = TOP()
        let products = Products(beverages: [top])
        let stockManager = StockManager(stock: [.TOP:products])
        let expected = VendingMachine(stockManager: stockManager)
        self.vendingMachine.add(beverage: top)
        XCTAssertEqual(self.vendingMachine, expected)
    }
    
    func testVendingMachineAddMultipleBeverage_sameBeverage() {
        let top1 = TOP()
        let top2 = TOP()
        let products = Products(beverages: [top1, top2])
        let stockManager = StockManager(stock: [.TOP:products])
        let expected = VendingMachine(stockManager: stockManager)
        self.vendingMachine.add(beverage: top1)
        self.vendingMachine.add(beverage: top2)
        XCTAssertEqual(self.vendingMachine, expected)
    }
    
    func testVendingMachineReadBuyableProducts() {
        vendingMachine.add(beverage: Coke())
        vendingMachine.add(beverage: Coke())
        vendingMachine.add(beverage: Coke())
        vendingMachine.add(beverage: Cantata())
        vendingMachine.add(beverage: Cantata())
        vendingMachine.add(beverage: Cantata())
        vendingMachine.add(beverage: Georgia())
        vendingMachine.add(beverage: Georgia())
        vendingMachine.add(beverage: Georgia())
        vendingMachine.add(beverage: Georgia())
        vendingMachine.insertMoney(1000)
        let expected = [ProductType.Coke:3, ProductType.Georgia:4]
        let buyable: [ProductType:Int] = vendingMachine.readBuyableProducts()
        XCTAssertEqual(expected, buyable)
    }
}
