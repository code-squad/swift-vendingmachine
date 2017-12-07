//
//  main.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

let strawberryMilk: Beverage = Milk.init(category: .strawberry, brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유")
let bananaMilk: Beverage = Milk.init(category: .banana, brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유")
let cola: Beverage = Soda.init(category: .coke, brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라")
let coffee: Beverage = Coffee.init(category: .top, brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노")

print(strawberryMilk)
print(bananaMilk)
print(cola)
print(coffee)
