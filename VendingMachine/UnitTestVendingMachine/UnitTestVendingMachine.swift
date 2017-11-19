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
    var vendingMachine: VendingMachine!
    var strawBerryMilk: StrawBerryMilk!
    var bananaMilk: BananaMilk!
    var coke: Coke!
    var coffee: Coffee!
    override func setUp() {
        super.setUp()
        strawBerryMilk = StrawBerryMilk(productTpye: "딸기우유",
                                        brand: "서울우유",
                                        weight: "200ml",
                                        price: "1000원",
                                        name: "날마다딸기우유",
                                        dateOfManufacture: "20171109",
                                        calorie: "300kcal",
                                        ingredients: ["strawBerrySyrup"],
                                        ratioOfStrawBerrySyrup: "3.2%")
        bananaMilk = BananaMilk(productTpye: "바나나우유",
                                brand: "서울우유",
                                weight: "200ml",
                                price: "2000원",
                                name: "날마다딸기우유",
                                dateOfManufacture: "20171112",
                                calorie: "350kcal",
                                ingredients: ["bananaSyrup"],
                                ratioOfBananaSyrup: "2.5%")
        coke = Coke(productTpye: "콜라",
                    calorie: "200kcal",
                    brand: "팹시",
                    weight: "350ml",
                    price: "2000원",
                    name: "다이어트콜라",
                    dateOfManufacture: "20111005",
                    amountOfSugar: "50g")
        coffee = Top(productTpye: "TOP커피",
                     calorie: "150kcal",
                     brand: "맥심",
                     weight: "400ml",
                     price: "3000원",
                     name: "TOP아메리카노",
                     dateOfManufacture: "20171110",
                     isHot: true,
                     amountOfCaffeine: "30mg",
                     nameOfCoffeeBeans: "Colombia",
                     taste: .chocolateMocha)
        
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
        XCTAssertEqual(vendingMachine.buy(product: strawBerryMilk), 1)
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
        XCTAssertEqual(vendingMachine.listOfCanBuy(), [strawBerryMilk])
    }
}
