//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct DateUnit {
    static let secondsOfOneday = 86400
}

struct VendingMachine {
    static func run(){
        let inventory = VendingMachine.inventory()
        _ = VendingMachine.information(beverage: inventory)
    }
    
    static func inventory() -> [Beverage] {
        let strawBerryDate = Date(timeIntervalSinceNow: -convertSeconds(10))
        let cokeDate = Date(timeIntervalSinceNow: -convertSeconds(15))
        let topCoffeeDate = Date(timeIntervalSinceNow: -convertSeconds(20))
        
        let strawberryMilk = StrawberryMilk(flavor: Flavor.light, fat: 0.2, brand: "매일우유", capacity: 125, price: 1200, name: "유기농딸기우유", dateOfManufacture: strawBerryDate, manufacturer: "매일우유")
        let coke = Coke(calorie: 300, sodium: 120, brand: "펩시", capacity: 350, price: 1500, name: "다이어트콜라", dateOfManufacture: cokeDate, manufacturer: "펩시")
        let topCoffee = TOP(hot: true, caffeine: 400, brand: "맥심", capacity: 500, price: 2000, name: "TOP커피", dateOfManufacture: topCoffeeDate, manufacturer: "맥심")

        var beverage = [Beverage]()
        beverage.append(strawberryMilk)
        beverage.append(coke)
        beverage.append(topCoffee)
        return beverage
    }
    
    static func convertSeconds(_ date: Int) -> Double {
        // 1일 : 86400초
        return Double(date * DateUnit.secondsOfOneday)
    }
    
    static func information(beverage : [Beverage]){
        for item in beverage {
            print(item.description)
        }
    }
}

VendingMachine.run()
