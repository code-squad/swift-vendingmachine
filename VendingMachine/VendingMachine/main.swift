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
    
    let selectedMode = InputView.readMode()
    guard let mode = Mode.init(rawValue: selectedMode) else {
        return
    }
    
    while true {
        switch mode {
        case .manager:
            let managerMode = vendingMachine as ManagerMode
            managerMode.showInventory(with: OutputView.beverageListForm)
            
            let selectedMenu = InputView.readManagerMenu()
            guard let menu = Menu.Manager.init(rawValue: selectedMenu) else {
                return
            }
            let value = InputView.readPrompt()
            guard let beverage = managerMode.fetchBeverage(at: value - 1) else {
                continue
            }
            switch menu {
            case .addStock:
                let addCount = InputView.readPrompt()
                managerMode.addStock(of: beverage, count: addCount)
            case .takeOutStock:
                let removeCount = InputView.readPrompt()
                managerMode.takeOutStock(of: beverage, count: removeCount)
            }
        case .user:
            let userMode = vendingMachine as UserMode
            userMode.showBalance(with: OutputView.balanceForm)
            userMode.showInventory(with: OutputView.beverageListForm)
            
            let selectedMenu = InputView.readUserMenu()
            guard let menu = Menu.User.init(rawValue: selectedMenu) else {
                return
            }
            let value = InputView.readPrompt()
            switch menu {
            case .insertMoney:
                guard userMode.insertMoney(amount: value) else {
                    continue
                }
            case .purchaseBeverage:
                guard let beverage = userMode.fetchBeverage(at: value - 1),
                    let _ = userMode.purchase(beverage: beverage, completion: OutputView.purchaseForm) else {
                        continue
                }
            }
        }
    }
}

main()
