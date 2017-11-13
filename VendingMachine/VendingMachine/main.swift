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
strawBerryMilk.printDrinkInfo()
bananaMilk.printDrinkInfo()
