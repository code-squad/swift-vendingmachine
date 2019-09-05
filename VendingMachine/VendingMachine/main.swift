//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let vendingMachine = VendingMachine(storage: Storage())
    vendingMachine.addStock(of: StrawberryMilk(), count: 3)
    vendingMachine.addStock(of: ChocolateMilk(), count: 5)
    vendingMachine.addStock(of: Coke(), count: 2)
    vendingMachine.addStock(of: Cider(), count: 1)
    vendingMachine.addStock(of: Americano(), count: 4)
    vendingMachine.addStock(of: CaffeLatte(), count: 3)
    
    while true {
        vendingMachine.showBalance(with: OutputView.balanceForm)
        vendingMachine.showInventory(with: OutputView.beverageListForm)
        
        let selectedNumber = InputView.menuNumber()
        guard let selected = Menu.init(rawValue: selectedNumber) else {
            return
        }
        let value = InputView.readPrompt()
        switch selected {
        case .insertMoney:
            guard vendingMachine.insertMoney(amount: value) else {
                continue
            }
        case .purchaseBeverage:
            guard let beverage = vendingMachine.fetchBeverage(at: value - 1),
                let _ = vendingMachine.purchase(beverage: beverage, completion: OutputView.purchaseForm) else {
                    continue
            }
        }
    }
}

main()


