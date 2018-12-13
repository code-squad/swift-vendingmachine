//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let chocolateMilk = ChocolateMilk(brand: "남양유업",
                                      name: "초코에몽",
                                      volume: 180,
                                      price: 1000,
                                      dateOfManufacture: Date.subtractingDaysFromNow(by: 2))
    let sprite = Sprite(volume: 250,
                        price: 1200,
                        dateOfManufacture: Date.subtractingDaysFromNow(by: 30),
                        package: .can)
    let cantata = Cantata(name: "칸타타 더치블랙",
                          volume: 275,
                          price: 2200,
                          dateOfManufacture: Date.subtractingDaysFromNow(by: 20),
                          ice: false)
    let beverages: [Beverage] = [chocolateMilk, sprite, cantata]

    beverages.forEach { beverage in
        print("\(beverage.className) - \(beverage)")
    }
}

main()
