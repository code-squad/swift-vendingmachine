//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let strawberryMilk = StrawberryMilk(stringDate: "20190630", strawberryContent: 20)
    let chocolateMilk = ChocolateMilk(fattyContent: 1.4)
    let coke = Coke(calorie: 200, sugarFree: false)
    let sprite = Sprite(calorie: 90, lemonContent: 3.5)
    let topCoffee = TOPCoffee(temperature: 70.0, arbicaBeansContent: true)
    let cantataCoffee = CantataCoffee(temperature: 30.0, DripStatus: true)
    print(strawberryMilk)
    print(chocolateMilk)
    print(coke)
    print(sprite)
    print(topCoffee)
    print(cantataCoffee)
}

main()
