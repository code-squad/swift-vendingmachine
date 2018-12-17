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
    var vendingMachine = VendingMachine(beginningBalance: 2000, initialInventory: Inventory(list: [:]))
    sampleBeverages.forEach { beverage in vendingMachine.add(beverage: beverage) }

    while(true) {
        do {
            try OutputView.start(vendingMachine)
            let input = InputView.readInput()
            let menu = try MenuController.readMenu(from: input)

            switch menu.item {
            case .insertCoin:
                let moneyInserted = menu.value
                guard vendingMachine.insert(money: moneyInserted) else { continue }
                OutputView.showInsertion(of: moneyInserted)
            case .purchaseBeverage:
                let listBuyable = vendingMachine.getListBuyable()
                let beverageSelected = menu.value - 1
                guard beverageSelected < listBuyable.count else { throw MenuError.outOfList }
                let packSelected = listBuyable[beverageSelected]
                guard let beveragePurchased = vendingMachine.buy(beverage: packSelected) else { continue }
                OutputView.showPurchase(of: beveragePurchased)
            }
        } catch let error as MenuError {
            OutputView.showMessage(of: error)
        } catch let error as VendingMachineError {
            OutputView.showMessage(of: error)
            break
        } catch {
            fatalError("UNEXPECTED ERROR")
        }
    }

}

main()
