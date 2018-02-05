//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Product {
    case ChocoMilk
    case BananaMilk
    case Coke
    case Coffee
    case DolceLatte
    case EnergyDrink
}

class VendingMachine {
    private(set) var stockContoller = StockController(items: [Beverage]())
    private var stock = [ObjectIdentifier: [Beverage]]()
    var balance = 0

    init(stockItems: [Beverage]) {
        self.stockContoller = StockController(items: stockItems)
        self.stock = stockContoller.setAsDictionary(stockItems)
    }

    func addBalance(money: Int) {
        balance += money
    }

    func subtractBalance(money: Int) {
        balance -= money
    }

    func showBalance() -> Int {
        return self.balance
    }

    func buy(itemSelected: ObjectIdentifier) -> BeverageDisplayStand {
        self.stock = stockContoller.removeItem(itemCode: itemSelected)
        self.subtractBalance(money: stockContoller.priceOfItem(itemSelected))
        return Stock(sortedItems: self.stock)
    }

    func add(inputItem: Beverage) -> BeverageDisplayStand {
        self.stock = stockContoller.addItem(item: inputItem)
        return Stock(sortedItems: self.stock)
    }

    func hotBeverage() -> BeverageDisplayStand {
        let hotItems = stockContoller.findHotBeverage()
        return ShowCase(itemsForDisplay: hotItems)
    }

    func history() -> History {
        return stockContoller.makeHistory()
    }

    func showStock() -> String {
        return self.stock.description
    }

    // 유통기한 지난 음료
    func discardItems() -> BeverageDisplayStand {
        let discardItems = stockContoller.findDiscardBeverage()
        return ShowCase(itemsForDisplay: discardItems)
    }

    // 유통기한 내의 음료
    func validItems() -> BeverageDisplayStand {
        let validItems = stockContoller.findValidBeverage()
        return ShowCase(itemsForDisplay: validItems)
    }

    // 현재 금액으로 구매 가능한 음료수
    func possibleToBuy() -> BeverageDisplayStand {
        let validItems = stockContoller.finditemsCheaper(than: self.balance)
        return ShowCase(itemsForDisplay: validItems)
    }

}

