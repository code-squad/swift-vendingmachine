//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {

    private(set) var stockController = StockController(items: [Beverage]())
    //private(set) var stock = [ObjectIdentifier: [Beverage]]()
    private var balance = 0

    init(stockItems: [Beverage]) {
        self.stockController = StockController(items: stockItems)
        //self.stock = stockContoller.setAsDictionary(stockItems)
    }

    func matchKey(_ option: Int) -> ObjectIdentifier? {
        switch option {
        case 1: return ObjectIdentifier(ChocoMilk.self)
        case 2: return ObjectIdentifier(BananaMilk.self)
        case 3: return ObjectIdentifier(SoftDrink.self)
        case 4: return ObjectIdentifier(Coffee.self)
        case 5: return ObjectIdentifier(DolceLatte.self)
        case 6: return ObjectIdentifier(EnergyDrink.self)
        default: return nil
        }
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

    func sell(option: Int, unit: Int) {
        let item = matchKey(option)
        guard let itemSelected = item else {
            return
        }
        // 구매할때 balance가 구매 총 금액보다 큰지 확인
        for _ in 0..<unit{
            //self.stock = stockContoller.removeItem(item: itemSelected)
            self.subtractBalance(money: stockController.priceOfItem(itemSelected))
        }
    }

    func buy(itemSelected: ObjectIdentifier) {
        // 구매할때 balance가 구매 총 금액보다 큰지 확인
        self.subtractBalance(money: stockController.priceOfItem(itemSelected))
    }

    func add(inputItem: Beverage) {
        stockController.addItem(item: inputItem)
    }

    func hotBeverage() -> BeverageDisplayStand {
        let hotItems = stockController.findHotBeverage()
        return ShowCase(itemsForDisplay: hotItems)
    }

    func history() -> History {
        return stockController.makeHistory()
    }

    func showStock() -> String {
        return stockController.stockStatus(of: "재고 상태")
    }

    // 맨 처음 모드 선택시에 보여주는 전체재고상태
    func showStockDefault() -> String {
        return stockController.showStock()
    }

    // 유통기한 지난 음료
    func discardItems() -> BeverageDisplayStand {
        let discardItems = stockController.findDiscardBeverage()
        return ShowCase(itemsForDisplay: discardItems)
    }

    // 유통기한 내의 음료
    func validItems() -> BeverageDisplayStand {
        let validItems = stockController.findValidBeverage()
        return ShowCase(itemsForDisplay: validItems)
    }

    // 현재 금액으로 구매 가능한 음료수
    func possibleToBuy() -> BeverageDisplayStand {
        let validItems = stockController.finditemsCheaper(than: self.balance)
        return ShowCase(itemsForDisplay: validItems)
    }

}

