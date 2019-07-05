//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by hw on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testValidateDate(){
        var inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 14)
        print("valid date : \(inputDate)")
        let bananaMilk = BananaMilk.init(brand: "매일유업", quantity: 350, price: 2000, name: "바나나에 빠진 우유", date: inputDate, isLowFat: true, bananaPercent: 0.1, farmCode: .imported)
        let today = Date.init() // 2019-07-05
        print("today : \(today)")
        XCTAssert(bananaMilk.validate(with: today), "(유통기한 경과) - \(bananaMilk.date)")
        
        inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 04)
        let bananaMilk2 = BananaMilk.init(brand: "매일유업", quantity: 350, price: 2000, name: "바나나에 빠진 우유", date: inputDate, isLowFat: true, bananaPercent: 0.1, farmCode: .imported)
        XCTAssertFalse(bananaMilk2.validate(with: today), "(유통기한 존재) - \(bananaMilk2.date)")

    }
    func testIsSugarDrink(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let coke = Coke.init(brand: "코카콜라", quantity: 500, price: 1500, name: "코카콜라", date: inputDate, coffeine: 0, sugar: 100)
        XCTAssert(coke.sugary == 100 )
        XCTAssert(coke.coffeineDisplay == 0)
        XCTAssertFalse(coke.hasCoffeine())
        
        let zeroCoke = Coke.init(brand: "코카콜라", quantity: 500, price: 1500, name: "코카콜라제로", date: inputDate, coffeine: 10, sugar: nil)
        XCTAssert(zeroCoke.sugary == 0)
        XCTAssert(zeroCoke.coffeineDisplay == 10)
        XCTAssertTrue(zeroCoke.hasCoffeine())
    }
    
   func testFarmCode(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let strawberry = StrawberryMilk.init(brand: "서울우유", quantity: 500, price: 1500, name: "딸기딸기", date: inputDate, isLowFat: false, fruitPercent: 0.5, farmCode: .kyunggy)
        XCTAssert(strawberry.origin == "국산", "result : \(strawberry.origin)")
        XCTAssert(strawberry.hasFarmCode() == FarmCode.kyunggy, "result : \(strawberry.hasFarmCode())" )
        let strawberry2 = StrawberryMilk.init(brand: "연세우유", quantity: 500, price: 1500, name: "딸기딸기", date: inputDate, isLowFat: false, fruitPercent: 0.5)
        XCTAssert(strawberry2.hasFarmCode() == FarmCode.none, "result : \(strawberry2.hasFarmCode())" )
    }
    
    func testFruitOrigin(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let strawberry = StrawberryMilk.init(brand: "건국우유", quantity: 500, price: 1500, name: "건국딸기", date: inputDate)
        XCTAssert(strawberry.origin == "국산", "\(strawberry.origin)")
        
        let strawberryFromJapan = StrawberryMilk.init(brand: "건국우유", quantity: 500, price: 1500, name: "건국딸기", date: inputDate, origin : "일본")
        XCTAssertTrue(strawberryFromJapan.origin != "국산", "\(strawberryFromJapan.origin)")
        XCTAssert(strawberryFromJapan.hasFarmCode() == .none, "\(strawberryFromJapan.farmCode)")
    }
    
    func testCheckBaseAntihypnoticalDrink(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let zeroPepsi = Coke(brand: "펩시", quantity: 350, price: 2000, name: "다이어트콜라", date: inputDate, sugar: 0)
        XCTAssert(zeroPepsi.hasCoffeine() == true , "result : \(zeroPepsi.hasCoffeine())" )
    }
    
    func testFantaInfo(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let grapeFanta = Fanta.init(brand: "코카콜라" , quantity: 1000, price: 2000, name: "코카환타 그레이프", date: inputDate, fruitType: .purpleGrape, sugar: 30)
        XCTAssert(grapeFanta.fruitType == .purpleGrape, "\(grapeFanta.fruitType)")
        XCTAssert(grapeFanta.sugary == 30 , "\(grapeFanta.sugary)")
    }
    
    func testCheckSugarCarbonatedDrink(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let zeroPepsi = Coke.init(brand: "펩시", quantity: 500, price: 3500, name: "콜라", date: inputDate, coffeine: 10, sugar: nil)
        XCTAssert(zeroPepsi.sugary == 0, "result : \(zeroPepsi.sugary)")
    }
    
    func testCoffeeBean(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let defaultTOPCoffee = TOPCoffee.init(brand: "동서", quantity: 350, price: 2500, name: "티오피 아메리카노", date: inputDate)
        XCTAssert(defaultTOPCoffee.coffeeBeanInfo == .arabica, "\(defaultTOPCoffee.coffeeBeanInfo)")
        XCTAssert(defaultTOPCoffee.coffeineDisplay == 100, "\(defaultTOPCoffee.coffeineDisplay)")
        
        let customTOPCoffee = TOPCoffee.init(brand: "맥심", quantity: 350, price: 2800, name: "티오피 라떼", date: inputDate, coffeine: 20, bean: .brazil, type: .latte)
        
        XCTAssert(customTOPCoffee.coffeeBeanInfo == .brazil, "\(customTOPCoffee.coffeeBeanInfo)")
        XCTAssert(customTOPCoffee.coffeineDisplay == 20, "\(customTOPCoffee.coffeineDisplay)")
    }
    
    func testCoffeeModel(){
        let inputDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 07, day: 05)
        let defaultCantataCoffee = CantataCoffee.init(brand: "동서", quantity: 500, price: 3000, name: "칸타타 오리지널", date: inputDate)
        XCTAssert(defaultCantataCoffee.model == "1Bean", "\(defaultCantataCoffee.model)")
        
        let customCantataCoffee = CantataCoffee.init(brand: "동서", quantity: 500, price: 3000, name: "칸타타 라떼", date: inputDate, coffeine: 110, bean: .ethiopia, model: "흥푸")
        XCTAssert(customCantataCoffee.model == "흥푸", "\(customCantataCoffee.model)")
        XCTAssert(customCantataCoffee.coffeeBeanInfo == .ethiopia, "\(customCantataCoffee.coffeeBeanInfo)")
    }
    
    private func generateBeverages() -> [Drinkable]{
        var result = [Drinkable]()
        
        var inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 09)
        let seoulStrawberry = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate, farmCode: .imported)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 12)
        let seoulStrawberry2 = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate, farmCode: .north_chungChung)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let zeroPepsi = Coke(brand: "펩시", quantity: 350, price: 2000, name: "다이어트콜라", date: inputDate,  sugar: 0)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 10)
        let TOPCoffeeAmericano = TOPCoffee.init(brand: "맥심", quantity: 400, price: 3000, name: "TOPCoffee아메리카노", date: inputDate, coffeine: 120.0, bean: .arabica, type: .americano)
        
        result.append(seoulStrawberry)
        result.append(seoulStrawberry2)
        result.append(zeroPepsi)
        result.append(TOPCoffeeAmericano)
        return result
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
