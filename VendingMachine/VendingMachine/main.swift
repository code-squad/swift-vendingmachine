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

        var inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 09)
        let seoulStrawberry = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 12)
        let seoulStrawberry2 = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let zeroPepsi = Coke(brand: "펩시", quantity: 350, price: 2000, name: "다이어트콜라", date: inputDate, isSugar: false)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 10)
        let topAmericano = TOP.init(brand: "맥심", quantity: 400, price: 3000, name: "TOP아메리카노", date: inputDate, coffeine: 120.0, origin: .arabica, type: .americano)

        result.append(seoulStrawberry)
        result.append(seoulStrawberry2)
        result.append(zeroPepsi)
        result.append(topAmericano)
        return result
    }
}
Main.start()
