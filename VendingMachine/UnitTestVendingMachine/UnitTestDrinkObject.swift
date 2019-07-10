//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by hw on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestDrinkObject: XCTestCase {

    override func setUp() {

    }

    func testValidateDate(){
        let calorySet = CaloryElements(carbon: 0, protein: 0, fat: 0)

        var inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 14)
        print("valid date : \(inputDate)")
        let bananaMilk = BananaMilk.init(brand: "매일유업", quantity: 350, price: 2000, name: "바나나에 빠진 우유", date: inputDate, isLowFat: true, bananaPercent: 0.1, milkFarmCode: .imported, calorySet: calorySet, temperature: 4.0)
        let today = Date.init() // 2019-07-05
        print("today : \(today)")
        XCTAssert(bananaMilk.validate(with: today), "(유통기한 경과) - \(bananaMilk.date)")
        
        inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 04)
        let bananaMilk2 = BananaMilk.init(brand: "매일유업", quantity: 350, price: 2000, name: "바나나에 빠진 우유", date: inputDate, isLowFat: true, bananaPercent: 0.1, milkFarmCode: .imported, calorySet: calorySet, temperature: 5.0)
        XCTAssertFalse(bananaMilk2.validate(with: today), "(유통기한 존재) - \(bananaMilk2.date)")

    }
    func testIsSugarDrink(){
        let calorySet = CaloryElements(carbon: 10, protein: 0, fat: 0)
        let temparature = 3.0
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let coke = Coke.init(brand: "코카콜라", quantity: 500, price: 1500, name: "코카콜라", date: inputDate, coffeine: 0, sugar: 100, calorySet: calorySet, temperature: temparature)
        XCTAssert(coke.sugary == 100 )
        XCTAssert(coke.coffeineDisplay == 0)
        XCTAssertFalse(coke.hasCoffeine())
        
        let zeroCoke = Coke.init(brand: "코카콜라", quantity: 500, price: 1500, name: "코카콜라제로", date: inputDate, coffeine: 10, sugar: nil, calorySet: calorySet, temperature: temparature)
        XCTAssert(zeroCoke.sugary == 0)
        XCTAssert(zeroCoke.coffeineDisplay == 10)
        XCTAssertTrue(zeroCoke.hasCoffeine())
    }
    
   func testFarmCode(){
        let calorySet = CaloryElements(carbon: 10, protein: 0, fat: 0)
        var temparature = 3.0

        let inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let strawberry = StrawberryMilk.init(brand: "서울우유", quantity: 500, price: 1500, name: "딸기딸기", date: inputDate, isLowFat: false, fruitPercent: 0.5, milkFarmCode: .kyunggy, calorySet: calorySet, temperature: temparature)
        XCTAssert(strawberry.fruitOrigin == "국산", "result : \(strawberry.fruitOrigin)")
        XCTAssert(strawberry.displayFarmCode() == FarmCode.kyunggy, "result : \(strawberry.displayFarmCode())" )
        let strawberry2 = StrawberryMilk.init(brand: "연세우유", quantity: 500, price: 1500, name: "딸기딸기", date: inputDate, isLowFat: false, fruitPercent: 0.5, fruitOrigin: "필리핀", milkFarmCode: .imported, calorySet: calorySet, temperature: temparature)
        XCTAssert(strawberry2.displayFarmCode() == FarmCode.imported, "result : \(strawberry2.displayFarmCode())" )
    }
    
    func testFruitOrigin(){
        let calorySet = CaloryElements(carbon: 10, protein: 0, fat: 0)
        var temparature = 3.0
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let strawberry = StrawberryMilk.init(brand: "건국우유", quantity: 500, price: 1500, name: "건국딸기", date: inputDate, calorySet: calorySet, temperature: 4)
        XCTAssert(strawberry.fruitOrigin == "국산", "\(strawberry.fruitOrigin)")
        
        let strawberryFromJapan = StrawberryMilk.init(brand: "건국우유", quantity: 500, price: 1500, name: "건국딸기", date: inputDate, fruitPercent: 0.9, fruitOrigin : "일본", milkFarmCode: .kangwon, calorySet: calorySet, temperature: 7)
        XCTAssertTrue(strawberryFromJapan.fruitOrigin != "국산", "\(strawberryFromJapan.fruitOrigin)")
        XCTAssert(strawberryFromJapan.displayFarmCode() == .kangwon, "\(strawberryFromJapan.displayFarmCode())")
    }
    
    func testCheckBaseAntihypnoticalDrink(){
        let calorySet = CaloryElements(carbon: 10, protein: 0, fat: 10)

        let inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let zeroPepsi = Coke(brand: "펩시", quantity: 350, price: 2000, name: "다이어트콜라", date: inputDate, sugar: 0, calorySet: calorySet, temperature: 6)
        XCTAssert(zeroPepsi.hasCoffeine() == true , "result : \(zeroPepsi.hasCoffeine())" )
    }
    
    func testFantaInfo(){
        let calorySet = CaloryElements(carbon: 10, protein: 1, fat: 5)
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let grapeFanta = Fanta.init(brand: "코카콜라" , quantity: 1000, price: 2000, name: "코카환타 그레이프", date: inputDate, fruitType: .purpleGrape, sugar: 30, calorySet: calorySet, temperature: 7)
        XCTAssert(grapeFanta.fruitType == .purpleGrape, "\(grapeFanta.fruitType)")
        XCTAssert(grapeFanta.sugary == 30 , "\(grapeFanta.sugary)")
    }
    
    func testCheckSugarCarbonatedDrink(){
        let calorySet = CaloryElements(carbon: 12, protein: 1, fat: 3)

        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let zeroPepsi = Coke.init(brand: "펩시", quantity: 500, price: 3500, name: "콜라", date: inputDate, coffeine: 10, sugar: nil, calorySet: calorySet, temperature: 6)
        XCTAssert(zeroPepsi.sugary == 0, "result : \(zeroPepsi.sugary)")
    }
    
    func testCoffeeBean(){
        let calorySet = CaloryElements(carbon: 12, protein: 1, fat: 3)
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let defaultTOPCoffee = TOPCoffee.init(brand: "동서", quantity: 350, price: 2500, name: "티오피 아메리카노", date: inputDate)
        XCTAssert(defaultTOPCoffee.coffeeBeanInfo == .arabica, "\(defaultTOPCoffee.coffeeBeanInfo)")
        XCTAssert(defaultTOPCoffee.coffeineDisplay == 100, "\(defaultTOPCoffee.coffeineDisplay)")
        
        let customTOPCoffee = TOPCoffee.init(brand: "맥심", quantity: 350, price: 2800, name: "티오피 라떼", date: inputDate, coffeine: 20, bean: .brazil, type: .latte, calorySet: calorySet, temperature: 55)
        XCTAssert(customTOPCoffee.isHot(), "\(customTOPCoffee.temperature)")
        XCTAssert(customTOPCoffee.coffeeBeanInfo == .brazil, "\(customTOPCoffee.coffeeBeanInfo)")
        XCTAssert(customTOPCoffee.coffeineDisplay == 20, "\(customTOPCoffee.coffeineDisplay)")
    }
    
    func testCoffeeModel(){
        let calorySet = CaloryElements(carbon: 12, protein: 1, fat: 3)
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let defaultCantataCoffee = CantataCoffee.init(brand: "동서", quantity: 500, price: 3000, name: "칸타타 오리지널", date: inputDate, coffeine: 80, bean: .arabica, model: "블루", calorySet: calorySet, temperature: 50)
        XCTAssert(defaultCantataCoffee.model == "블루", "\(defaultCantataCoffee.model)")
        
        let customCantataCoffee = CantataCoffee.init(brand: "동서", quantity: 500, price: 3000, name: "칸타타 라떼", date: inputDate, coffeine: 110, bean: .ethiopia, model: "흥푸", calorySet: calorySet, temperature: 50)
        XCTAssert(customCantataCoffee.model == "흥푸", "\(customCantataCoffee.model)")
        XCTAssert(customCantataCoffee.coffeeBeanInfo == .ethiopia, "\(customCantataCoffee.coffeeBeanInfo)")
        XCTAssert(customCantataCoffee.isHot(), "\(customCantataCoffee.temperature)")
    }
    
    private func generateBeverages() -> [Drinkable]{
        var result = [Drinkable]()
        var calorySet = CaloryElements(carbon: 0, protein: 0, fat: 0)
        var inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 09)
        let seoulStrawberry = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate, milkFarmCode: .kangwon, calorySet: calorySet, temperature: 4)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 12)
        let seoulStrawberry2 = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate, milkFarmCode: .imported, calorySet: calorySet, temperature: 4)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let zeroPepsi = Coke(brand: "펩시", quantity: 350, price: 2000, name: "다이어트콜라", date: inputDate, sugar: 0, calorySet: calorySet, temperature: 10)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 10)
        let topAmericano = TOPCoffee.init(brand: "맥심", quantity: 400, price: 3000, name: "TOP아메리카노", date: inputDate, coffeine: 120.0, bean: .arabica, type: .americano, calorySet: calorySet, temperature: 20)
        
        result.append(seoulStrawberry)
        result.append(seoulStrawberry2)
        result.append(zeroPepsi)
        result.append(topAmericano)
        return result
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
