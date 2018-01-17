//
//  main.swift
//  VendingMachine
//
//  Created by Jack (2018/01/15)
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let form = DateFormatter()
form.dateFormat = "yyyyMMdd"

let strawberryMilk = StrawberryMilk(brand: "서울우유", name: "날마다딸기우유", volume: 200, price: 1000, manufacturedDate: form.date(from: "20170117") ?? Date(), expirationDate: form.date(from: "20170131") ?? Date())
let bananaMilk = BananaMilk(brand: "서울우유", name: "날마다바나나우유", volume: 200, price: 1000, manufacturedDate: form.date(from: "20170115") ?? Date(), expirationDate: form.date(from: "20170129") ?? Date())
let pepsi = PepciCoke(brand: "팹시", name: "다이어트콜라", volume: 350, price: 2000, manufacturedDate: form.date(from: "20170201") ?? Date(), lowCalorie: true)
let maxim = TOPCoffee(brand: "맥심", name: "TOP아메리카노", volume: 400, price: 3000, manufacturedDate: form.date(from: "20170110") ?? Date(), hot : false)

print(strawberryMilk)
print(bananaMilk)
print(pepsi)
print(maxim)
