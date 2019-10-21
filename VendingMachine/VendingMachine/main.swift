//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let milk = Milk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다 딸기우유", date: Date("20171009"), isLowFat: false)
let soda = Soda(brand: "펩시", capacity: 350, price: 2000, name: "다이어트 콜라", date: Date("20171005"), isSugarFree: true)
let coffee = Coffee(brand: "맥심", capacity: 400, price: 3000, name: "TOP 아메리카노", date: Date("20171010"), coffeeType: .americano)

print(milk)
print(soda)
print(coffee)
