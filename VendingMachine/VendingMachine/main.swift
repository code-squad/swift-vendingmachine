//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let vendingMachine = VendingMachine(inventory: Inventory())
    vendingMachine.addStock(of: StrawberryMilk(), count: 3)
    vendingMachine.addStock(of: ChocolateMilk(), count: 5)
    vendingMachine.addStock(of: Coke(), count: 2)
    vendingMachine.addStock(of: Cider(), count: 1)
    vendingMachine.addStock(of: Americano(), count: 4)
    vendingMachine.addStock(of: CaffeLatte(), count: 3)

    while true {
        vendingMachine.showBalance(with: OutputView.balanceForm)
        vendingMachine.printInventory()
        
        let selectedNumber = InputView.menuNumber()
        guard let selected = Menu.init(rawValue: selectedNumber) else {
            return
        }
        let value = InputView.readPrompt()
        switch selected {
        case .insertMoney:
            vendingMachine.insertMoney(amount: value)
        case .purchaseBeverage:            
            if let beverage = vendingMachine.inventory[value - 1],
                let purchased = vendingMachine.purchase(beverage: beverage) {
                purchased.showBeverage(with: OutputView.purchaseForm)
            }
        }
    }
}

main()
