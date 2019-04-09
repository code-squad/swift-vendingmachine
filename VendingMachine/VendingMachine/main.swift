//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    // motion: 자판기 작동을 위한 변수
    var motion = true
    let beverages = [Sprite(), Sprite(), Sprite(), CocaCola(), CocaCola(), CocaCola(), CocaCola(),ChocolateMilk(), ChocolateMilk(), BananaMilk(),CantataCoffee(), CantataCoffee(), CantataCoffee(), StarbucksCoffee(),StarbucksCoffee()]
    
    var vendingMachine = VendingMachine(startMoney: 0, list: Inventory(list: [:]))

    beverages.forEach {
        beverage in vendingMachine.add(beverage: beverage)
    }
    
    
    
}

main()
