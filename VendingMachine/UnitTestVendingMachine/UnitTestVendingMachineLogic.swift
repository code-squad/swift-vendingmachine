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
    let minimumCaloryElements = CaloryElements(carbon: 0, protein: 0, fat: 0)
    let defaultCaloryElements = CaloryElements(carbon: 10, protein: 0, fat: 10)
    let sugarCaloryElements = CaloryElements(carbon: 30, protein: 0, fat: 5)
    
    override func setUp() {
        self.vendingMachine = initializeVendingMachineTest()
        vendingMachine?.chargeBalance(2000)
    }
    
    func testNotForSaleItemList(){
        guard let vendingMachine = self.vendingMachine else {
            return
        }
        ///Add invalid drink
        addInvalidDrink()
        notForSaleItemList = vendingMachine.showValidateOverDrink()
        XCTAssert(notForSaleItemList.count == 1, "\(notForSaleItemList.count)")
    }
    
    func testSaleItemList(){
        guard let vendingMachine = self.vendingMachine else {
            return
        }
        ///add valid drink
        addValidDrink()
        var notForSaleItemList = vendingMachine.showValidateOverDrink()
        XCTAssert(notForSaleItemList.count == 0, "\(notForSaleItemList.count)")
        
    }
    
    func testBuyNotForSaleItem(){
        guard let vendingMachine = self.vendingMachine else {
            return
        }
        ///add valid drink
        addValidDrink()
        var notForSaleItemList = vendingMachine.showValidateOverDrink()
        XCTAssert(notForSaleItemList.count == 0, "\(notForSaleItemList.count)")
        
        ///Add invalid drink
        addInvalidDrink()
        
        //buy drink only validate 
        buyOnlyValidDrink()
    }
    
    private func buyOnlyValidDrink(){
        guard let vendingMachine = self.vendingMachine else {
            return
        }
        do {
            var drink = try vendingMachine.sellProduct(productId: 6)
            XCTAssert(drink.validate(with: Date.init()) == true)
            vendingMachine.chargeBalance(10000)
            drink = try vendingMachine.sellProduct(productId: 6)
        }catch let error as VendingMachineError {
            XCTAssert( error == .outOfStockError, "\(error)")
        }catch{
        }
    }
    
    private func addValidDrink(){
        guard let vendingMachine = self.vendingMachine else {
            return
        }
        let validDay = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        var drink = Fanta.init(brand: "코카콜라", quantity: 1000, price: 2000, name: "환타포도맛", date: validDay, fruitType: .purpleGrape, sugar: 1000, calorySet: sugarCaloryElements, temperature: 5)
        do {
            try vendingMachine.addDrinkStock(drink)
        }catch{
        }
    }
    
    private func addInvalidDrink(){
        guard let vendingMachine = self.vendingMachine else {
            return
        }
        let invalidDay = CustomDateFormatter.convertStringToDate(year: 2019, month: 7, day: 10)  // today is 2018/7/11
        var drink = Fanta.init(brand: "코카콜라", quantity: 1000, price: 2000, name: "환타포도맛", date: invalidDay, fruitType: .purpleGrape, sugar: 1000, calorySet: sugarCaloryElements, temperature: 5)
        do {
            try vendingMachine.addDrinkStock(drink)
        }catch{
        }
    }
    
    func testDrinkStockDictionary(){
        guard let vendingMachine = vendingMachine else {
            return
        }
        do{
            let drinkStockDictionary = vendingMachine.drinkStockTable
//            XCTAssert(drinkStockDictionary.count == 5, "\(drinkStockDictionary)")
//            XCTAssert(drinkStockDictionary is [Int : DrinkItemList])
            subtestOfDrinkDictionaryInfo(drinkStockDictionary)
            subtestOfSameGroupInEachDictionaryValue(drinkStockDictionary)
        }
    }
    
    private func subtestOfSameGroupInEachDictionaryValue(_ drinkStockDictionary: [Int : DrinkItemList]){
        for pair in drinkStockDictionary.enumerated(){
            let stockList = pair.element.value.drinkStockList
            for index in 0..<stockList.endIndex-1{
                XCTAssert( stockList[index].drinkName == stockList[index+1].drinkName)
                XCTAssert( type(of:stockList[index]) == type(of:stockList[index+1]))
            }
        }
    }
    
    private func subtestOfDrinkDictionaryInfo(_ drinkStockDictionary: [Int : DrinkItemList]){
        for pair in drinkStockDictionary.enumerated(){
            XCTAssert(pair.element.value.drinkStockInfo.name == pair.element.value.drinkName, "\(pair.element.value.drinkStockInfo.name) , \(pair.element.value.drinkName)")
            XCTAssert(pair.element.value.drinkStockInfo.price == pair.element.value.drinkStockList[0].price, "\(pair.element.value.drinkStockInfo.price) , \(pair.element.value.drinkStockList[0].price)")
        }
    }
    
    func testBuyDrink(){
        guard let vendingMachine = vendingMachine else {
            return
        }
        do {
            var drink = try vendingMachine.sellProduct(productId: 1)
            XCTAssert(drink.drinkName == "매일딸기우유", "\(drink)")
            drink = try vendingMachine.sellProduct(productId: 1)
            drink = try vendingMachine.sellProduct(productId: 4)
        }catch let error as VendingMachineError{
            XCTAssert(error == .notEnoughMoneyError, "\(error)")
        }catch{
            
        }
    }
    
    func testSoldHistory(){
        guard let vendingMachine = vendingMachine else {
            return
        }
        do {
            vendingMachine.chargeBalance(4000)
            var drink = try vendingMachine.sellProduct(productId: 1)
            XCTAssert(drink.drinkName == "매일딸기우유", "\(drink)")
            drink = try vendingMachine.sellProduct(productId: 4)
            drink = try vendingMachine.sellProduct(productId: 1)
            let shoppingHistory = vendingMachine.showShoppingHistory()
            XCTAssert(shoppingHistory.count == 3 , "\(shoppingHistory)")
            XCTAssert(shoppingHistory[0].drinkName == "매일딸기우유", "\(shoppingHistory[0].drinkName)")
        }catch{
            
        }
    }
    
    func testSoldOut(){
        guard let vendingMachine = vendingMachine else {
            return
        }
        do {
            vendingMachine.chargeBalance(4000)
            var drink = try vendingMachine.sellProduct(productId: 5)
            drink = try vendingMachine.sellProduct(productId: 5)
            drink = try vendingMachine.sellProduct(productId: 5)
        }catch let error as VendingMachineError {
            XCTAssert(error == .outOfStockError, "\(error)")
        }catch{
            
        }
    }
    
    func testCheckBalance(){
        guard let vendingMachine = vendingMachine else {
            return
        }
        vendingMachine.chargeBalance(1000)
        vendingMachine.showCurrentBalanceInfo { (balance) in
            XCTAssert(balance == 3000, "\(balance)")
        }
    }
    
    func testHotDrinkList() {
        guard var hotDrinkList = vendingMachine?.showHotterDrinkList() else {
            return
        }
        XCTAssert(hotDrinkList[0].drinkName == "TOP커피")
        XCTAssert(hotDrinkList.count == 2, "\(hotDrinkList)")
        print("vending: \(String(describing: vendingMachine))")
        vendingMachine?.chargeBalance(2000)
        let product = try? vendingMachine?.sellProduct(productId: 4)
        print("product: \(String(describing: product))")
        guard let afterSellingHotDrink = vendingMachine?.showHotterDrinkList() else{
            return
        }
        XCTAssert(vendingMachine?.showHotterDrinkList().count == 1, "\(hotDrinkList)")
    }
    
    func testBuyableDrinkList() {
        guard let list = vendingMachine?.showBuyableDrinkList() else {
            return
        }
        XCTAssert(list.count == 4, "\(list.count)")
    }
    
    func testPileSpecificDrinkStcok(){
        /// before
        beforeDrinkAdd()
        /// add stock
        addExistingDrink()
        /// after stock
        afterDrinkAdd()
    }
    
    private func beforeDrinkAdd(){
        let beforeAdd = vendingMachine?.drinkStockTable.count
        XCTAssert(beforeAdd == 5, "\(String(describing: beforeAdd))")
    }
    private func addExistingDrink(){
        let validDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        let firstDrink = StrawberryMilk.init(brand: "매일우유", quantity: 500, price: 1000, name: "매일딸기우유", date: validDate, isLowFat: false, fruitPercent: 3.0, fruitOrigin: "국산", milkFarmCode: .kyunggy, calorySet: defaultCaloryElements, temperature: 4)
        do {
            try vendingMachine?.addDrinkStock(firstDrink)
        }catch{
            
        }
    }
    private func afterDrinkAdd(){
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
        beforeDrinkAdd()
        /// add new type stock
        addNewTypeDrink()
        /// After stock
        afterNewTypeDrinkAdd()
    }
    
    private func afterNewTypeDrinkAdd(){
        let result = (vendingMachine?.drinkStockTable[1]?.drinkStockList.count)!
        let newDrinkListCount = (vendingMachine?.drinkStockTable[6]?.drinkStockList.count)!
        let afterAdd = vendingMachine?.drinkStockTable.count
        guard let menuTable = vendingMachine?.drinkNameMenuTable else{
            return
        }
        guard let stockTable = vendingMachine?.drinkStockTable else {
            return
        }
        XCTAssert(afterAdd == 6, "\(String(describing: afterAdd))")
        XCTAssert(result == 2, "\(result)" )
        XCTAssert(newDrinkListCount == 1, "\(newDrinkListCount)")
        XCTAssert(menuTable.count == 6, "\(menuTable.count)")
    }
    
    private func addNewTypeDrink(){
        let defaultCaloryElements = CaloryElements(carbon: 10, protein: 0, fat: 10)
        let validDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        let firstDrink = StrawberryMilk.init(brand: "코드스쿼드", quantity: 500, price: 1700, name: "JK딸기우유", date: validDate, isLowFat: false, fruitPercent: 3.0, fruitOrigin: "국산", milkFarmCode: .kyunggy, calorySet: defaultCaloryElements, temperature: 4)
        do {
            try vendingMachine?.addDrinkStock(firstDrink)
        }catch{
        }
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
    
}
