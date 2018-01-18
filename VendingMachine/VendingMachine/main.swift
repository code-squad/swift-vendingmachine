//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run() {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"

    let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(), strawberrySyrup: 5)
    let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
    let coke = Coke(brand: "팹시", weight: 350, price: 2000, name: "다이어트콜라", manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
    let coffee = Top(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactureDate: formatter.date(from: "20171010") ?? Date(), isHotDrink: false) //nil coalescing optional
    
    let vendingMachine = VendingMachine()
    vendingMachine.addInInventory(beverage: strawberryMilk)
    vendingMachine.addInInventory(beverage: bananaMilk)
    vendingMachine.addInInventory(beverage: coke)
    vendingMachine.addInInventory(beverage: strawberryMilk)
    vendingMachine.addInInventory(beverage: coffee)
    
    let inputView = InputView(vendingMachine: vendingMachine)
    inputView.usingVendingMachine()
    
}
run()
