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
        let products = Products(beverages: [])
        products.append(coke)
        let expectedProducts = Products(beverages: [coke])
        XCTAssertEqual(products, expectedProducts)
    }
    
    func testProductsAppendMultipleBeverage() {
        let cantata = Cantata()
        let sprite = Sprite()
        let products = Products(beverages: [])
        products.append(cantata)
        products.append(sprite)
        let expectedProducts = Products(beverages: [cantata, sprite])
        XCTAssertEqual(products, expectedProducts)
    }
    
    func testStockManagerAddBeverage() {
        let chocoMilk = ChocoMilk()
        let chocoMilkType = chocoMilk.productType ?? ProductType.ChocoMilk
        let products = Products(beverages: [chocoMilk])
        let stockManager = StockManager(stock: [:])
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
    
    func testBuyBeverage_checkBalanceAfterBuy() {
        vendingMachine.add(beverage: Coke())
        vendingMachine.add(beverage: Coke())
        vendingMachine.add(beverage: Coke())
        vendingMachine.insertMoney(2020)
        vendingMachine.buy(.Coke)
        XCTAssertEqual(vendingMachine.readBalance(), "1020원")
    }
    
    func testBuyBeverage_checkBeverageBought() {
        let coke1 = Coke()
        let coke2 = Coke()
        let coke3 = Coke()
        vendingMachine.add(beverage: coke1)
        vendingMachine.add(beverage: coke2)
        vendingMachine.add(beverage: coke3)
        vendingMachine.insertMoney(2020)
        let boughtBeverage = vendingMachine.buy(.Coke)
        XCTAssertEqual(boughtBeverage, coke3)
    }
    
    func testBuyBeverage_whenBeverageIsSoldOut() {
        vendingMachine.insertMoney(1000)
        XCTAssertNil(vendingMachine.buy(.ChocoMilk), "Beverage is sold out")
    }
    
    func testReadAllStock() {
        let coke1 = Coke()
        let coke2 = Coke()
        let sprite = Sprite()
        let strawberryMilk = StrawberryMilk()
        vendingMachine.add(beverage: coke1)
        vendingMachine.add(beverage: coke2)
        vendingMachine.add(beverage: sprite)
        vendingMachine.add(beverage: strawberryMilk)
        let expected: [ProductType:Products] = [
            ProductType.Coke : Products(beverages: [coke1, coke2]),
            ProductType.Sprite : Products(beverages: [sprite]),
            ProductType.StrawberryMilk : Products(beverages: [strawberryMilk])
        ]
        XCTAssertEqual(vendingMachine.readAllStock(), expected)
    }
    
    func testRemoveExpiredBeverages() {
        let coke1 = Coke(brand: "코카콜라", capacity: 200, price: 1000, name: "코카콜라", manufacturedDate: "20170202", calories: 80, hasIce: true, isHot: false)
        let coke2 = Coke(brand: "코카콜라", capacity: 200, price: 1000, name: "제로콜라", manufacturedDate: "20180614", calories: 0, hasIce: false, isHot: false)
        let sprite = Sprite(brand: "칠성", capacity: 200, price: 1000, name: "칠성사이다", manufacturedDate: "20180602", calories: 80, hasOneMoreOnCap: true, isHot: false)
        vendingMachine.add(beverage: coke1)
        vendingMachine.add(beverage: sprite)
        vendingMachine.add(beverage: coke2)
        let expected: [Beverage] = [coke1, sprite]
        XCTAssertEqual(vendingMachine.removeExpired(), expected)
    }
    
    func testRemoveExpiredBeverages_remainedBeverages() {
        let cantata = Cantata(brand: "칸타타", capacity: 200, price: 1000, name: "칸타타", manufacturedDate: "20180602", caffeineContent: 35.3, flavor: "아메리카노", isHot: true)
        let coke = Coke(brand: "코카콜라", capacity: 200, price: 1000, name: "제로콜라", manufacturedDate: "20180612", calories: 0, hasIce: false, isHot: false)
        let sprite = Sprite(brand: "칠성", capacity: 200, price: 1000, name: "칠성사이다", manufacturedDate: "20171212", calories: 80, hasOneMoreOnCap: true, isHot: false)
        let chocoMilk = ChocoMilk(brand: "서울우유", capacity: 350, price: 1300, name: "초코우유", manufacturedDate: "20180614", hasCacao: true, isHot: false)
        vendingMachine.add(beverage: cantata)
        vendingMachine.add(beverage: coke)
        vendingMachine.add(beverage: sprite)
        vendingMachine.add(beverage: chocoMilk)
        vendingMachine.removeExpired()
        let expected: [ProductType:Products] = [
            ProductType.Coke : Products(beverages: [coke]),
            ProductType.ChocoMilk : Products(beverages: [chocoMilk])
        ]
        XCTAssertEqual(vendingMachine.readAllStock(), expected)
    }
    
    func testRemoveHotBeverages() {
        let cantata1: Cantata = Cantata(brand: "칸타타", capacity: 100, price: 1000, name: "칸타타커피", manufacturedDate: "20180101", caffeineContent: 30, flavor: "아메리카노", isHot: true)
        let cantata2: Cantata = Cantata(brand: "칸타타", capacity: 100, price: 1000, name: "칸타타커피", manufacturedDate: "20180101", caffeineContent: 30, flavor: "아메리카노", isHot: true)
        let georgia: Georgia = Georgia(brand: "조지아", capacity: 100, price: 1000, name: "조지아커피", manufacturedDate: "20170303", caffeineContent: 30, flavor: "라떼", isHot: false)
        vendingMachine.add(beverage: cantata1)
        vendingMachine.add(beverage: cantata2)
        vendingMachine.add(beverage: georgia)
        let expected = [cantata1, cantata2]
        XCTAssertEqual(vendingMachine.removeHot(), expected)
    }
    
    func testRemoveHotBeverages_remainBeverages() {
        let cantata1: Cantata = Cantata(brand: "칸타타", capacity: 100, price: 1000, name: "칸타타커피", manufacturedDate: "20180101", caffeineContent: 30, flavor: "아메리카노", isHot: true)
        let cantata2: Cantata = Cantata(brand: "칸타타", capacity: 100, price: 1000, name: "칸타타커피", manufacturedDate: "20180101", caffeineContent: 30, flavor: "아메리카노", isHot: true)
        let georgia: Georgia = Georgia(brand: "조지아", capacity: 100, price: 1000, name: "조지아커피", manufacturedDate: "20170303", caffeineContent: 30, flavor: "라떼", isHot: false)
        vendingMachine.add(beverage: cantata1)
        vendingMachine.add(beverage: cantata2)
        vendingMachine.add(beverage: georgia)
        let expected = [ProductType.Georgia:Products(beverages: [georgia])]
        vendingMachine.removeHot()
        XCTAssertEqual(vendingMachine.readAllStock(), expected)
    }
}
