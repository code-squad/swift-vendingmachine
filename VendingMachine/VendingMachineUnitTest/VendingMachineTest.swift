//
//  VendingMachineTest.swift
//  VendingMachineUnitTest
//
//  Created by 이진영 on 2019/11/11.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class VendingMachineTest: XCTestCase {
    var beverages: [Beverage] = []
    var inventory: BeverageInventory!
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        beverages.append(CafeLatte())
        beverages.append(Americano())
        beverages.append(Coke())
        beverages.append(LemonlimeDrink())
        beverages.append(StrawberryMilk())
        beverages.append(ChocolateMilk())
        
        inventory = .init(stock: beverages)
        vendingMachine = .init(inventory: inventory)
        
        _ = vendingMachine.insert(money: 2000)
    }
    
    func testInsertValidBalance() {
        XCTAssertTrue(vendingMachine.insert(money: 1000))
    }

    func testInsertInvalidBalance() {
        XCTAssertFalse(vendingMachine.insert(money: -1000))
    }
    
    func testFetchPurchasableProducts() {
        let fetchPurchasableProducts = vendingMachine.fetchProducts(option: .purchasable)
        let purchasableProducts = [Coke(), LemonlimeDrink(), StrawberryMilk(), ChocolateMilk()]
        let unpurchasableProducts = [CafeLatte(), Americano()]
        
        for fetchResult in fetchPurchasableProducts {
            XCTAssertTrue(purchasableProducts.contains(where: { purchasableProduct in
                purchasableProduct.objectID == fetchResult.objectID
            }))
            
            XCTAssertFalse(unpurchasableProducts.contains(where: { unpurchasableProduct in
                unpurchasableProduct.objectID == fetchResult.objectID
            }))
        }
    }
    
    func testFetchHotProducts() {
        let fetchHotProducts = vendingMachine.fetchProducts(option: .hot)
        let hotProducts = [CafeLatte(), Americano()]
        let notHotProducts = [Coke(), LemonlimeDrink(), StrawberryMilk(), ChocolateMilk()]
        
        for fetchResult in fetchHotProducts {
            XCTAssertTrue(hotProducts.contains(where: { hotProduct in
                hotProduct.objectID == fetchResult.objectID
            }))
            
            XCTAssertFalse(notHotProducts.contains(where: { notHotProduct in
                notHotProduct.objectID == fetchResult.objectID
            }))
        }
    }

    func testFetchExpiredProducts() {
        let fetchExpiredProducts = vendingMachine.fetchProducts(option: .expired)
        let expiredProducts = [Americano(), StrawberryMilk(), LemonlimeDrink()]
        let validateProducts = [CafeLatte(), ChocolateMilk(), Coke()]
        
        for fetchResult in fetchExpiredProducts {
            XCTAssertTrue(expiredProducts.contains(where: { expiredProduct in
                expiredProduct.objectID == fetchResult.objectID
            }))
            
            XCTAssertFalse(validateProducts.contains(where: { validateProduct in
                validateProduct.objectID == fetchResult.objectID
            }))
        }
    }
    
    func testFetchHistory() {
        var history: [ObjectIdentifier] = []
        
        _ = vendingMachine.insert(money: 10000)
        
        for _ in 0...3 {
            if let beverage = vendingMachine.purchaseProduct(index: 1) {
                history.append(beverage.objectID)
            }
        }
        
        let fetchHistoryResult = vendingMachine.fetchHistory().map { $0.objectID }
        
        XCTAssertEqual(history, fetchHistoryResult)
    }
}
