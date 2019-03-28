//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let bananaMilk = BananaMilk()

//let banaMilk = Milk.init(brand: "매일유업", volume: 350, price: 800, name: "바나나는 월래 하얗다", manufacturedDate: Date(), temperature: 4.0)
let cocaCola = CocaCola()

let starbucksCoffee = StarbucksCoffee()

let beverages: [Beverage] = [bananaMilk, cocaCola,starbucksCoffee]

beverages.forEach {
    beverage in
    print("\(beverage.className) - \(beverage)")
}


