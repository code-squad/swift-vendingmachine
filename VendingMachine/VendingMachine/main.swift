//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    static func run(){
        let inventory = VendingMachine.inventory()
        _ = VendingMachine.information(beverage: inventory)
    }
    
    static func inventory() -> [Beverage] {
        let strawBerryDate = Date(timeIntervalSinceReferenceDate: 545000000)
        let cokeDate = Date(timeIntervalSinceReferenceDate: 545500000)
        let topCoffeeDate = Date(timeIntervalSinceReferenceDate: 545850000)
        
        let strawberryMilk = Milk(fat: 0.2, brand: "매일우유", capacity: 125, price: 1200, name: "상하목장유기농딸기우유", dateOfManufacture: strawBerryDate, manufacturer: "매일우유")
        let coke = Soda(sodium: 120, brand: "펩시", capacity: 350, price: 1500, name: "다이어트콜라", dateOfManufacture: cokeDate, manufacturer: "펩시")
        let topCoffee = Coffee(caffeine: 300, brand: "맥심", capacity: 500, price: 2000, name: "TOP커피", dateOfManufacture: topCoffeeDate, manufacturer: "맥심")
        
        var beverage = [Beverage]()
        beverage.append(strawberryMilk)
        beverage.append(coke)
        beverage.append(topCoffee)
        
        return beverage
    }
    
    static func information(beverage : [Beverage]){
        for item in beverage {
            print(item.description)
        }
    }
}

VendingMachine.run()
