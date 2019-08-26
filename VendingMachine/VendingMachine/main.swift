//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var beverages = [Beverage]()

let dateOfManufactured = "20190731"
let expirationDate = "20190830"

let chocolateMilk = ChocolateMilk(manufacturer: "서울우유", dateOfManufactured: "20190801", expirationDate: "20190811", brand: "초코꿀단지", capacity: 180, unit: .milliliters, fatContent: 11, chocolateContent: 2, price: 1800)
let bingreStrawberryMilk = StrawberrrMilk(manufacturer: "빙그레", dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: "빙그레", capacity: 240, unit: .milliliters, fatContent: 13, strawberryContent: 5, price: 1500)

let zeroCoke = Coke(variant: .zero, manufacturer: "한국코카콜라", dateOfManufactured: "20190601", expirationDate: expirationDate, brand: .cocaCola, capacity: 500, unit: .milliliters, price: 1800)
let pepsiCoke = Coke(variant: .regular, manufacturer: "롯데칠성", dateOfManufactured: "20190601", expirationDate: expirationDate, brand: .pepsiCola, capacity: 500, unit: .milliliters, price: 1500)
let sprite = Sprite(variant: .regular, manufacturer: "한국코카콜라", dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, capacity: 185, unit: .milliliters, price: 1900)

let cantata = Cantata(variation: .latte, containerType: .can, manufacturer: "롯데칠성음료", dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, capacity: 180, unit: .milliliters, price: 2000)
let hotCantata = Cantata(variation: .americano, containerType: .can, manufacturer: "롯데칠성음료", dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, capacity: 200, unit: .milliliters, price: 2500, isHot: true)

let hotsix = HotSix(variant: .light, manufacturer: "롯데칠성음료", dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, capacity: 250, unit: .milliliters, price: 1500, caffeineContent: 60)
beverages.append(contentsOf: [chocolateMilk, bingreStrawberryMilk, zeroCoke, pepsiCoke, sprite, cantata, hotCantata, hotsix])
for beverage in beverages {
    print(beverage)
}
