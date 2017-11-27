//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by yangpc on 2017. 11. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest
@testable import VendingMachine
class UnitTestVendingMachine: XCTestCase {
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        strawBerryMilk = nil
        bananaMilk = nil
        coke = nil
        coffee = nil
        vendingMachine = nil
    }
    
    func testAddMoney() {
        vendingMachine.add(money: 500000)
        XCTAssertEqual(vendingMachine.howMuchRemainMoney(), 500000)
    }
    
    func testAddProduct() {
        XCTAssertEqual(vendingMachine.add(product: strawBerryMilk), 1)
    }
    
    func testListOfInventory() {
        vendingMachine.add(product: strawBerryMilk)
        vendingMachine.add(product: bananaMilk)
        vendingMachine.add(product: coke)
        vendingMachine.add(product: coffee)
        XCTAssertEqual(vendingMachine.listOfInventory().count, 4)
    }
    
    func testBuyProductExistInInventry() {
        vendingMachine.add(product: strawBerryMilk)
        XCTAssertEqual(vendingMachine.buy(product: strawBerryMilk), strawBerryMilk)
    }
    
    func testBuyProductNotExistInInventry() {
        XCTAssertNil(vendingMachine.buy(product: strawBerryMilk))
    }
    
    func testBuySoldOutProduct() {
        vendingMachine.add(product: strawBerryMilk)
        vendingMachine.buy(product: strawBerryMilk)
        XCTAssertNil(vendingMachine.buy(product: strawBerryMilk))
    }

    func testListOfOverExpirationDate() {
        vendingMachine.add(product: coke)
        XCTAssertEqual(vendingMachine.listOfOverExpirationDate(), [coke])
    }
    
    func testListOfOverExpirationDateEmpty() {
        vendingMachine.add(product: coffee)
        XCTAssertEqual(vendingMachine.listOfOverExpirationDate().count, 0)
    }

    func testListOfHotDrink() {
        vendingMachine.add(product: coffee)
        XCTAssertEqual(vendingMachine.listOfHotDrink(), [coffee])
    }

    func testListOfPurchaseProduct() {
        vendingMachine.add(product: strawBerryMilk)
        vendingMachine.buy(product: strawBerryMilk)
        XCTAssertEqual(vendingMachine.listOfPurchase().count , 1)
    }
    
    func testListOfCanBuy() {
        vendingMachine.add(product: strawBerryMilk)
        vendingMachine.add(product: bananaMilk)
        vendingMachine.add(money: 1000)
        XCTAssertEqual(vendingMachine.listOfCanBuy().count, 1)
    }
    
    func testIntegratedVendingMachineMethods() {
        vendingMachine.add(product: strawBerryMilk)
        vendingMachine.add(product: strawBerryMilk)
        vendingMachine.add(product: strawBerryMilk)
        vendingMachine.add(product: bananaMilk)
        vendingMachine.add(product: bananaMilk)
        vendingMachine.add(product: coke)
        vendingMachine.add(product: coke)
        vendingMachine.add(product: coffee)
        XCTAssertEqual(vendingMachine.listOfInventory().count, 4)
        vendingMachine.add(money: 10000)
        XCTAssertEqual(vendingMachine.howMuchRemainMoney(), 10000)
        XCTAssertEqual(vendingMachine.listOfCanBuy().count, 4)
        vendingMachine.buy(product: strawBerryMilk)
        XCTAssertEqual(vendingMachine.howMuchRemainMoney(), 9000)
        let listOfInventory = vendingMachine.listOfInventory()
        for product in listOfInventory {
            if product is StrawBerryMilk {
                XCTAssertEqual(product.value, 2)
                break
            }
        }
        let listOfPurchase = vendingMachine.listOfPurchase()
        XCTAssertEqual(listOfPurchase.count, 1)
    }
    
}
