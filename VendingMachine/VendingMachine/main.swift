//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


var beverages = [
    beverage(brand: "pepsi", capacity: 150, price: 900, name: "콜라", manufactureDate: Date(timeIntervalSinceNow: -2*86300)),
    beverage(brand: "남양", capacity: 130, price: 1300, name: "초코에몽", manufactureDate: Date(timeIntervalSinceNow: -3*86300)),
    beverage(brand: "델몬트", capacity: 120, price: 1800, name: "오렌지주스", manufactureDate: Date(timeIntervalSinceNow: -5*86300))
]

for beverage in beverages {
    print(beverage)
}
