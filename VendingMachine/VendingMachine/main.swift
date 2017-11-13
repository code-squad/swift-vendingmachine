//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let strawBerryMilk = Milk(taste: .strawBerry,
                          brand: "서울우유",
                          weight: "200ml",
                          price: "1000원",
                          name: "날마다딸기우유",
                          dateOfManufacture: "20171009")
let bananaMilk = Milk(taste: .banana,
                      brand: "서울우유",
                      weight: "200ml",
                      price: "1000원",
                      name: "날마다딸기우유",
                      dateOfManufacture: "20171012")
let coke = SoftDrink(taste: .coke,
                     brand: "팹시",
                     weight: "350ml",
                     price: "2000원",
                     name: "다이어트콜라",
                     dateOfManufacture: "20171005")
let coffee = Coffee(taste: .original,
                    brand: "맥심",
                    weight: "400ml",
                    price: "3000원",
                    name: "TOP아메리카노",
                    dateOfManufacture: "20171010")
strawBerryMilk.printDrinkInfo()
bananaMilk.printDrinkInfo()
coke.printDrinkInfo()
coffee.printDrinkInfo()
