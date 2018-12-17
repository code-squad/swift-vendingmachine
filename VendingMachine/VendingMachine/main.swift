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
        OutputView.start(vendingMachine)
        guard let menuSelected = InputView.readMenu() else { continue }
        guard let firstMenu = MenuItem(rawValue: menuSelected.first) else { continue }
        
        switch firstMenu {
        case .insertCoin:
            let moneyInserted = menuSelected.second
            guard vendingMachine.insert(money: moneyInserted) else { continue }
            OutputView.showInsertion(of: moneyInserted)
        case .purchaseBeverage:
            let listBuyable = vendingMachine.getListBuyable()
            let beverageSelected = menuSelected.second - 1
            guard beverageSelected < listBuyable.count else { continue }
            let packSelected = listBuyable[beverageSelected]
            guard let beveragePurchased = vendingMachine.buy(beverage: packSelected) else { continue }
            OutputView.showPurchase(of: beveragePurchased)
        }
    }

}

main()
