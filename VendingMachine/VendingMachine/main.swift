//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let today = DateUtility.today()
let strawberryMilk = Milk(.strawberry, "서울우유", 200, 1000, "날마다딸기우유", today)
let bananaMilk = Milk(.banana, "서울우유", 200, 1000, "날마다딸기우유", today)
let georgia = Coffee(.georgia, "맥심", 400, 3000, "TOP아메리카노", today)
let cola = CarbonatedDrink(.cola, "펩시", 350, 2000, "다이어트콜라", today)

print(strawberryMilk.description)
print(bananaMilk.description)
print(georgia.description)
print(cola.description)
