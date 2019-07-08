//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

//서울우유, 200ml, 1000원, 날마다딸기우유, 20171012
//팹시, 350ml, 2000원, 다이어트콜라, 20171005
//맥심, 400ml, 3000원, TOP아메리카노, 20171010

class Main {
    static func start(){
        let result = Main.generateBeverages()
        result.forEach { (Drinkable) in
            OutputView.printBeverage(Drinkable)
        }
    }
    
    /// generate sample Beverages
    static private func generateBeverages() -> [Drinkable]{
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
}
Main.start()
