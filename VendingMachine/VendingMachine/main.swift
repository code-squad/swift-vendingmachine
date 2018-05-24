//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let expirationDate = DateFormatter()
expirationDate.dateFormat = "yyyyMMdd"

let strawberryMilk = StrawberryMilk.init("서울우유", 200, 1000, "날마다딸기우유", expirationDate.date(from: "20190609")!)
let chocoMilk = ChocoMilk.init("서울우유", 200, 1000, "날마다초코우유", expirationDate.date(from: "20180612")!)
let cokeSoda = Coke.init("팹시", 350, 2000, "다이어트콜라", expirationDate.date(from: "20181005")!)
let americano = Top.init("맥심", 400, 3000, "TOP아메리카노", expirationDate.date(from: "20181010")!)

print(strawberryMilk)
print(chocoMilk)
print(cokeSoda)
print(americano)
