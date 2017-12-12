//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func executeMain() {
    let strawberryMilk = Milk(kind: "딸기", brand: "서울우유", volume: 200, price: 1000, name: "날마다딸기우유", manufacturingDate: "20171009")
    let bananaMilk = Milk(kind: "바나나", brand: "서울우유", volume: 200, price: 1000, name: "날마다바나나우유", manufacturingDate: "20171012")
    let coke = SodaPop(kind: "콜라", brand: "팹시", volume: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005")
    let coffee = Coffee(kind: "커피", brand: "맥심", volume: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010")
    print(strawberryMilk)
    print(bananaMilk)
    print(coke)
    print(coffee)
}
executeMain()
