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

let strawberryMilk = Milk(kind: "딸기우유",brand: "서울우유", name: "날마다 딸기우유", volume: 200, price: 1000, date: form.date(from: "20170101") ?? Date())
let bananaMilk = Milk(kind: "바나나우유", brand: "서울우유", name: "날마다 바나나우유", volume: 200, price: 1000, date: form.date(from: "20170105") ?? Date())
let pepsi = SodaPop(kind: "콜라", brand: "팹시", name: "다이어트콜라", volume: 350, price: 700, date: form.date(from: "20160105") ?? Date())
let maxim = Coffee(kind: "커피", brand: "맥심", name: "TOP아메리카노", volume: 400, price: 3000, date: form.date(from: "20170110") ?? Date())

print(strawberryMilk)
print(bananaMilk)
print(pepsi)
print(maxim)
