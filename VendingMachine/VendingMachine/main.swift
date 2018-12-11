//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let chocolateMilk = Milk(brand: "남양유업", name: "초코에몽", volume: 180, price: 1000, dateOfManufacture: Date(timeIntervalSinceNow: 5))
    let sprite = SoftDrink(brand: "스프라이트", name: "스프라이트", volume: 250, price: 1200, dateOfManufacture: Date(timeIntervalSinceNow: 50))
    let cantata = Coffee(brand: "롯데칠성", name: "칸타타", volume: 275, price: 2200, dateOfManufacture: Date(timeIntervalSinceNow: 30))
    let beverages: [Beverage] = [chocolateMilk, sprite, cantata]
    
    beverages.forEach { beverage in
        print(beverage)
    }
}

main()
