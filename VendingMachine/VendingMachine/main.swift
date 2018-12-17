//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let sampleBeverages = [ChocolateMilk(), ChocolateMilk(), StrawberryMilk(),
                           Sprite(), Sprite(), Sprite(), Pepsi(), Pepsi(), Pepsi(), Pepsi(),
                           Cantata(), Cantata(), Cantata(), Georgia()]
    let beginningBalance = 1000
    let initialInventory = Inventory(list: [:])
    let vendingMachine = VendingMachine(beginningBalance: beginningBalance, initialInventory: initialInventory)
    sampleBeverages.forEach { beverage in
        vendingMachine.add(beverage: beverage)
    }
    InputView.showBeverageList(of: vendingMachine)
}

main()
