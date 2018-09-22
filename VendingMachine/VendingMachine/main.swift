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
        
        let strawberryMilk = StrawberryMilk(dateOfManufacture: strawBerryDate)
        let coke = Coke(dateOfManufacture: cokeDate)
        let topCoffee = TOP(dateOfManufacture: topCoffeeDate)

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
