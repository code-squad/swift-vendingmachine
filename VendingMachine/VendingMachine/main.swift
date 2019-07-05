//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let strawberryMilk = Milk(capacity: 200, price: 1000, name: "날마다딸기우유", stringDate: "20190701", milkFarmCode: 1234567)
    let dietCoke = Soda(capacity: 350, price: 2000, name: "다이어트콜라", stringDate: "20190701", calorie: 200)
    let top = Coffee(capacity: 400, price: 3000, name: "TOP아메리카노", stringDate: "20190701", temperature: 70.0)
    print(strawberryMilk.description)
    print(dietCoke.description)
    print(top.description)
}

main()
