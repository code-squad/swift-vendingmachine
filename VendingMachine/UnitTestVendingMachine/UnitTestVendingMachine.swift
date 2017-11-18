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
                                price: "1000원",
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
        
        vendingMachine = VendingMachine(products: [ strawBerryMilk!: 1,
                                                    bananaMilk!: 2,
                                                    coke!: 5,
                                                    coffee!: 3 ] )
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddMoney() {
        vendingMachine.add(money: 500000)
        XCTAssertEqual(vendingMachine.money, 500000)
    }
    
    func testAddProduct() {
        let topCoffee = Top(productTpye: "TOP커피",
                            calorie: "150kcal",
                            brand: "TOP",
                            weight: "200ml",
                            price: "3000원",
                            name: "TOP아메리카노",
                            dateOfManufacture: "20171111",
                            isHot: true,
                            amountOfCaffeine: "30mg",
                            nameOfCoffeeBeans: "Colombia",
                            taste: .theBlack)
        XCTAssertEqual(vendingMachine.add(product: topCoffee!), 1)
    }
    
    func testBuyLastProductAndBuyEmptyProduct() {
        XCTAssertEqual(vendingMachine.buy(product: strawBerryMilk), 1)
        XCTAssertNil(vendingMachine.buy(product: strawBerryMilk))
    }
    
    func testListOfOverExpirationDate() {
        XCTAssertEqual(vendingMachine.listOfOverExpirationDate().count, 1)
    }
    
    func testListOfHotDrink() {
        XCTAssertEqual(vendingMachine.listOfHotDrink().count, 1)
    }
    
    func testListOfBuyedProduct() {
        vendingMachine.buy(product: strawBerryMilk)
        XCTAssertEqual(vendingMachine.listOfBuyedProduct(), [strawBerryMilk])
    }
}
