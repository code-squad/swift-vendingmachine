//
//  UnitTestVendingMachineLogic.swift
//  UnitTestVendingMachine
//
//  Created by hw on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachineLogic: XCTestCase {
    var vendingMachine: VendingMachine?
    override func setUp() {
        self.vendingMachine = initializeVendingMachineTest()
        vendingMachine?.chargeBalance(2000)
    }

    private func createDrinkItemList(drink: Drink, count: Int ) -> DrinkItemList{
        var drinkList = [Drink]()
        let drinkInfo = BeverageInfo.init(drink: drink)
        for _ in 0..<count{
            drinkList.append(drink)
        }
        let firstItemList = DrinkItemList.init(drinkList: drinkList, stockInfo: drinkInfo)
        return firstItemList
    }
    
    private func makeDrinkListByType() -> [Drink]{
        let minimumCaloryElements = CaloryElements(carbon: 0, protein: 0, fat: 0)
        let defaultCaloryElements = CaloryElements(carbon: 10, protein: 0, fat: 10)
        let sugarCaloryElements = CaloryElements(carbon: 30, protein: 0, fat: 5)
        let validDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        var drinkList = [Drink]()
        let firstDrink = StrawberryMilk.init(brand: "매일우유", quantity: 500, price: 1000, name: "매일딸기우유", date: validDate, isLowFat: false, fruitPercent: 3.0, fruitOrigin: "국산", milkFarmCode: .kyunggy, calorySet: defaultCaloryElements, temperature: 4)
        let secondDrink = Coke.init(brand: "펩시", quantity: 500, price: 1500, name: "펩시콜라", date: validDate, sugar: 30, calorySet: sugarCaloryElements, temperature: 5)
        let thirdDrink = BananaMilk.init(brand: "서울우유", quantity: 350, price: 1300, name: "바나나우유", date: validDate, isLowFat: false, bananaPercent: 3, fruitOrigin: "필리핀", milkFarmCode: .kangwon, calorySet: defaultCaloryElements, temperature: 5)
        let fourthDrink = TOPCoffee.init(brand: "맥심", quantity: 450, price: 3000, name: "TOP커피", date: validDate, coffeine: 90, bean: .ethiopia, type: .americano, calorySet: minimumCaloryElements, temperature: 60)
        let fifthDrink = HotSix.init(brand: "롯데칠성", quantity: 250, price: 800, name: "핫식스", date: validDate, sugar: 35, coffeine: 100, taurine: 100, calorySet: sugarCaloryElements, temp: 5)
        
        drinkList.append(firstDrink)
        drinkList.append(secondDrink)
        drinkList.append(thirdDrink)
        drinkList.append(fourthDrink)
        drinkList.append(fifthDrink)
        return drinkList
    }
    
    func initializeVendingMachineTest() -> VendingMachine{
        var drinkTable = [Int: DrinkItemList]()
        var drinkList = makeDrinkListByType()
        for index in 0..<drinkList.count {
            let itemList = createDrinkItemList(drink: drinkList[index], count: 2)
            drinkTable.updateValue(itemList, forKey: index+1)
        }
        let machine = VendingMachine(drinkStockTable: drinkTable)
        return machine
    }
    
    func testHotDrinkList() {
        guard var hotDrinkList = vendingMachine?.showHotterDrinkList() else {
            return
        }
        XCTAssert(hotDrinkList[0].drinkName == "TOP커피")
        XCTAssert(hotDrinkList.count == 2, "\(hotDrinkList)")
        print("vending: \(vendingMachine)")
        vendingMachine?.chargeBalance(2000)
        let product = try? vendingMachine?.sellProduct(productId: 4)
        print("product: \(product)")
        guard var afterSellingHotDrink = vendingMachine?.showHotterDrinkList() else{
            return
        }
        XCTAssert(vendingMachine?.showHotterDrinkList().count == 1, "\(hotDrinkList)")
    }
    
    func testBuyableDrinkList() {
        guard var list = vendingMachine?.showBuyableDrinkList() else {
            return
        }
        XCTAssert(list.count == 4, "\(list.count)")
    }
    
    func testPileSpecificDrinkStcok(){
        /// before
        let beforeAdd = vendingMachine?.drinkStockTable.count
        XCTAssert(beforeAdd == 5, "\(String(describing: beforeAdd))")
        guard let menuTableBefore = vendingMachine?.drinkNameMenuTable else{
            return
        }
        guard let stockTableBefore = vendingMachine?.drinkStockTable else {
            return
        }
        /// add stock
        let defaultCaloryElements = CaloryElements(carbon: 10, protein: 0, fat: 10)
        let validDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        let firstDrink = StrawberryMilk.init(brand: "매일우유", quantity: 500, price: 1000, name: "매일딸기우유", date: validDate, isLowFat: false, fruitPercent: 3.0, fruitOrigin: "국산", milkFarmCode: .kyunggy, calorySet: defaultCaloryElements, temperature: 4)
        do {
            try vendingMachine?.addDrinkStock(firstDrink)
        }catch{
            
        }
        
        /// after stock
        let result = (vendingMachine?.drinkStockTable[1]?.drinkStockList.count)!
        let afterAdd = vendingMachine?.drinkStockTable.count
        guard let menuTable = vendingMachine?.drinkNameMenuTable else{
            return
        }
        guard let stockTable = vendingMachine?.drinkStockTable else {
            return
        }
        XCTAssert(afterAdd == 5, "\(String(describing: afterAdd))")
        XCTAssert(result == 3, "\(result)" )
    }
    
    func testPileNewTypeDrinkStcok(){
        /// before
        let beforeAdd = vendingMachine?.drinkStockTable.count
        XCTAssert(beforeAdd == 5, "\(String(describing: beforeAdd))")
        guard let menuTableBefore = vendingMachine?.drinkNameMenuTable else{
            return
        }
        guard let stockTableBefore = vendingMachine?.drinkStockTable else {
            return
        }
        
        /// add new type stock
        let defaultCaloryElements = CaloryElements(carbon: 10, protein: 0, fat: 10)
        let validDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        let firstDrink = StrawberryMilk.init(brand: "코드스쿼드", quantity: 500, price: 1700, name: "JK딸기우유", date: validDate, isLowFat: false, fruitPercent: 3.0, fruitOrigin: "국산", milkFarmCode: .kyunggy, calorySet: defaultCaloryElements, temperature: 4)
        do {
            try vendingMachine?.addDrinkStock(firstDrink)
        }catch{
            
        }
        
        /// After stock
        let result = (vendingMachine?.drinkStockTable[1]?.drinkStockList.count)!
        let newDrinkListCount = (vendingMachine?.drinkStockTable[6]?.drinkStockList.count)!
        let afterAdd = vendingMachine?.drinkStockTable.count
        guard let menuTable = vendingMachine?.drinkNameMenuTable else{
            return
        }
        guard let stockTable = vendingMachine?.drinkStockTable else {
            return
        }
        print("======================")
        print("menuTableAfterNewType : \(menuTable)")
        print("stockTableAfterNewType : \(stockTable)")
        
        XCTAssert(afterAdd == 6, "\(String(describing: afterAdd))")
        XCTAssert(result == 2, "\(result)" )
        XCTAssert(newDrinkListCount == 1, "\(newDrinkListCount)")
    }
}
