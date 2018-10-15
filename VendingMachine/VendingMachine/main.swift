//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let milk = Beverage(brand: "서울우유", volume: 200, price: 1000, name: "날마다딸기우유", date: Date(timeIntervalSinceNow: 360000))
let pepsi = Beverage(brand: "팹시", volume: 350, price: 2000, name: "다이어트콜라", date: Date(timeIntervalSinceNow: 720000))
let maxim = Beverage(brand: "맥심", volume: 400, price: 3000, name: "TOP아메리카노", date: Date(timeIntervalSinceNow: 250000))

print(milk)
print(pepsi)
print(maxim)
