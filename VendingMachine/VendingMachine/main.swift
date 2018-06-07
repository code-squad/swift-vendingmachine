//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    
    let strawberryMilk: Milk = Milk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다딸기우유", manufacturedDate: "20171009")
    let chocolateMilk: Milk = Milk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다초코우유", manufacturedDate: "20171012")
    let coke: Soda = Soda(brand: "펩시", capacity: 350, price: 2000, name: "다이어트콜라", manufacturedDate: "20171005")
    let topCoffee: Coffee = Coffee(brand: "맥심", capacity: 400, price: 3000, name: "TOP아메리카노", manufacturedDate: "20171010")
    
    print(strawberryMilk)
    print(chocolateMilk)
    print(coke)
    print(topCoffee)
}

main()
