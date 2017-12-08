//
//  main.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

let strawberryMilk: Beverage = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", validate: "20171212")
let bananaMilk: Beverage = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", validate: "20171212")
let pepciCoke: Beverage = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", lowCalorie: true)
let topCoffee: Beverage = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", hot: true)

print(strawberryMilk)
print(bananaMilk)
print(pepciCoke)
print(topCoffee)
