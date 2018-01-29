//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let outputView = OutputView()

let strawberryMilk = Milk(flavor: "딸기", brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactured: "20171009")

let bananaMilk = Milk(flavor: "바나나", brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20171012")

let coke = SoftDrink(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", manufactured: "20171005")
let coffee = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")

outputView.showResult(strawberryMilk)
outputView.showResult(bananaMilk)
outputView.showResult(coke)
outputView.showResult(coffee)

