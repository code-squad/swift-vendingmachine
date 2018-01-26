//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyyMMdd"

let outputView = OutputView()

let strawberryMilk = Milk(flavor: "딸기", brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", MFDDate: dateFormatter.date(from: "20171009") ?? Date())

let bananaMilk = Milk(flavor: "바나나", brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", MFDDate: dateFormatter.date(from: "20171012") ?? Date())

let coke = SoftDrink(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", MFDDate: dateFormatter.date(from: "20171005") ?? Date())
let coffee = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", MFDDate: dateFormatter.date(from: "20171010") ?? Date())

outputView.showResult(strawberryMilk)
outputView.showResult(bananaMilk)
outputView.showResult(coke)
outputView.showResult(coffee)

