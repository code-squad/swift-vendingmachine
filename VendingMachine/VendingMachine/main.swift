//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run() {
    //    딸기우유 - 서울우유, 200ml, 1000원, 날마다딸기우유, 20171009
    //    바나나우유 - 서울우유, 200ml, 1000원, 날마다딸기우유, 20171012
    //    콜라 - 팹시, 350ml, 2000원, 다이어트콜라, 20171005
    //    커피 - 맥심, 400ml, 3000원, TOP아메리카노, 20171010
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    
    if let date = formatter.date(from: "20161009") {
        let strawberryMilk = Milk(menu: .Strawberry, brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: date)
        print(strawberryMilk.description)
    }
    if let date = formatter.date(from: "20171012") {
        let bananaMilk = Milk(menu: .Banana, brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: date)
        print(bananaMilk.description)
    }
//    if let date = formatter.date(from: "20161008") {
//        let menu3 = Soda(menu: , brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: date)
//    }
//    if let date = formatter.date(from: "20161008") {
//        let menu4 = Coffee(menu: , brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: date)
//    }
    
}
run()
