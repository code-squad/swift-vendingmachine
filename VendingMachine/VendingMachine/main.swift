//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let vendingMachine = VendingMachine()
    vendingMachine.addStock(of: StrawberryMilk(), count: 3)
    vendingMachine.addStock(of: ChocolateMilk(), count: 5)
    vendingMachine.addStock(of: Coke(), count: 2)
    vendingMachine.addStock(of: Cider(), count: 1)
    vendingMachine.addStock(of: Americano(), count: 4)
    vendingMachine.addStock(of: CaffeLatte(), count: 3)
    
    let vendingMachineService = VendingMachineService(vendingMachine: vendingMachine)

    while true {
        vendingMachineService.selectMenu()
    }
}

main()
