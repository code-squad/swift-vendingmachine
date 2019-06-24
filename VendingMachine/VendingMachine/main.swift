//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var beverages = [
    Beverage(brand: "서울 우유", packageSize: 200, price: 1000, name: "딸기우유", dateOfManufacture: Date()),
    Beverage(brand: "팹시", packageSize: 350, price: 2000, name: "다이어트 콜라", dateOfManufacture: Date()),
    Beverage(brand: "맥심", packageSize: 400, price: 3000, name: "TOP 아메리카노", dateOfManufacture: Date()),
]

for beverage in beverages {
    print(beverage)
}
