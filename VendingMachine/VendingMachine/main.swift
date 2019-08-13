//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

print("=================================================")
let beverage = Beverage()
print(beverage: beverage)
print("=================================================")
let milk = Milk()
let strawberryMilk = StrawberryMilk(brand: "서울우유",
                                    capacity: 200,
                                    price: 900,
                                    name: "딸기우유")
let chocolateMilk = ChocolateMilk(brand: "GS25",
                                  capacity: 500,
                                  price: 1500,
                                  name: "스누피 초코우유")
print(beverage: milk)
print(beverage: strawberryMilk)
print(beverage: chocolateMilk)
print("=================================================")
let soda = Soda()
print(beverage: soda)

let coke = Cola(brand: "코카-콜라 컴퍼니",
                capacity: 250,
                price: 1200,
                name: "코키-콜라")
let redBull = EnergyDrink(brand: "레드불 컴퍼니",
                          capacity: 300,
                          price: 1800,
                          name: "레드불")

print(beverage: coke)
print(beverage: redBull)
print("=================================================")
print(beverage: Coffee())
let americano  = Americano(brand: "빽다방",
                           capacity: 750,
                           price: 2000,
                           name: "앗!메리카노")
let cafeLatte = CafeLatte(brand: "스타벅스",
                          capacity: 500,
                          price: 5300,
                          name: "돌체라떼")
print(beverage: americano)
print(beverage: cafeLatte)

