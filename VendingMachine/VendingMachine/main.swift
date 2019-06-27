//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let beverages = [
    StrawberryMilk(milkFactoryIdentifier: "어느목장1", dateOfManufacture: Date(year: 2019, month: .june, day: 26)!),
    Cola(dateOfManufacture: Date(year: 2019, month: .june, day: 15)!),
    LemonlimeDrink(dateOfManufacture: Date(year: 2018, month: .february, day: 5)!),
    TOPCoffee(dateOfManufacture: Date(year: 2019, month: .january, day: 21)!)
]

for beverage in beverages {
    print(beverage)
}


