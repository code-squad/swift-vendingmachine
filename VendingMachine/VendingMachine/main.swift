//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let milk = Milk(
    brand: "서울우유",
    capacity: 200,
    price: 1000,
    name: "초코우유",
    dateOfManufactured: Date("20171009")
)

let coke = SoftDrink(
    brand: "펩시",
    capacity: 350,
    price: 2000,
    name: "다이어트콜라",
    dateOfManufactured: Date("20190812")
)

let top = Coffee(
    brand: "맥심",
    capacity: 400,
    price: 3000,
    name: "TOP아메리카노",
    dateOfManufactured: Date()
)

print(milk)
print(coke)
print(top)
