//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let dateFormatter: DateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyDDmm"
    
    let strawberryMilk: Milk = Milk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다딸기우유", date: dateFormatter.date(from: "20171009")!, flavor: .strawberry)
    let chocolateMilk: Milk = Milk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다초코우유", date: dateFormatter.date(from: "20171012")!, flavor: .chocolate)
    let coke: Soda = Soda(brand: "펩시", capacity: 350, price: 2000, name: "다이어트콜라", date: Date(), flavor: .coke)
    let topCoffee: Coffee = Coffee(brand: "맥심", capacity: 400, price: 3000, name: "TOP아메리카노", date: Date(), flavor: .top)
    
    print(strawberryMilk)
    print(chocolateMilk)
    print(coke)
    print(topCoffee)
}

main()
