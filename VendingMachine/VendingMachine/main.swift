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
    
    let strawberryMilk = Milk(menu: .Strawberry, brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20161009") ?? Date())
    print(strawberryMilk.description)
    
    let bananaMilk = Milk(menu: .Banana, brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171012") ?? Date())
    print(bananaMilk.description)
    
    let coke = Soda(menu: .Coke, brand: "팹시", weight: 350, price: 2000, name: "다이어트콜라", manufactureDate: formatter.date(from: "20171005") ?? Date())
    print(coke.description)
    
    let coffee = Coffee(menu: .Top, brand: "맥심", weight: 400, price: 3000, name: "아메리카노", manufactureDate: formatter.date(from: "20171010") ?? Date()) //nil coalescing optional
    print(coffee.description)
    
}
run()
