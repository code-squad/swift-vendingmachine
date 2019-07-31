//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var beverages = [Beverage]()
let chocolateMilk = Milk(flavor: .chocolate, manufacturer: "서울우유", dateOfManufacture: "20190731", brand: "날마다", capacity: 200, unit: .milliliters, price: 2000)
let bingreBananaMilk = Milk(flavor: .banana, manufacturer: "빙그레", dateOfManufacture: "20190729", brand: "빙그레", capacity: 240, unit: .milliliters, price: 1500)
let topAmericano = Coffee(variation: .americano, manufacturer: "맥심", dateOfManufacture: "20190710", brand: "TOP", capacity: 200, unit: .milliliters, price: 2500)
let zeroCoke = Coke(variant: .zero, manufacturer: "한국코카콜라", dateOfManufacture: "20190601", brand: "코카콜라", capacity: 500, unit: .milliliters, price: 1800)
let pepsiCoke = Coke(variant: .regular, manufacturer: "롯데칠성", dateOfManufacture: "20190601", brand: "펩시콜라", capacity: 500, unit: .milliliters, price: 1500)
let orangeFanta = Fanta(variant: .orange, dateOfManufacture: "20190530", capacity: 600, unit: .milliliters, price: 3000)

beverages.append(contentsOf: [chocolateMilk, bingreBananaMilk, topAmericano, zeroCoke, pepsiCoke, orangeFanta])
for beverage in beverages {
    print(beverage)
}
