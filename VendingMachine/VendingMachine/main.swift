//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let strawberryMilk = StrawberryMilk(stringDate: "20190630")
    let chocolateMilk = ChocolateMilk()
    let coke = Coke(calorie: 200)
    let sprite = Sprite(calorie: 90)
    let topCoffee = TOPCoffee(temperature: 70.0)
    let cantataCoffee = CantataCoffee(temperature: 30.0)
    print(strawberryMilk)
    print(chocolateMilk)
    print(coke)
    print(sprite)
    print(topCoffee)
    print(cantataCoffee)
}

main()
