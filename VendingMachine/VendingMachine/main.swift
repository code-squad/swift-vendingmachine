//
//  main.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", validate: "20171212")
let chocolateMilk = ChocolateMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "초코우유", validate: "20171220")
let bananaMilk = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", validate: "20171212")
let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", lowCalorie: true)
let sprite = Sprite.init(brand: "코카콜라", weight: 350, price: 2000, name: "스프라이트", lowCalorie: false)
let fanta = Fanta.init(brand: "코카콜라", weight: 350, price: 2000, name: "환타", lowCalorie: false)
let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", hot: true)
let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", hot: true)
let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", hot: false)

print(strawberryMilk)
print(chocolateMilk)
print(bananaMilk)
print(pepciCoke)
print(sprite)
print(fanta)
print(topCoffee)
print(kantata)
print(georgia)
print(strawberryMilk.validate(with: Date()))
print(pepciCoke.isLowCalorie())
print(topCoffee.isHot())
