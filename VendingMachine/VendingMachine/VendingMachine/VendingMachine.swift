//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol UserAvailableMode {
    func IsAbleToinsert(coin: Int) -> State
    func isAbleTopick(menu: Int) -> State
    func pick(menu: Int) -> Beverage
    func insert(coin: Int)
    func getPurchaseListInsertedCoin() -> [String]
}

protocol ManageableMode {
    func addStock(drink: Beverage)
    func removeDrink(_ menu: Int) -> Beverage
}

protocol PrintableMachingState {
    func machineState(form: (Coin, Stock) -> Void)
}

class VendingMachine {
    private var coin: Coin = Coin()
    private var stock: Stock = Stock()
    private var purchaseHistory: PurchaseHistory = PurchaseHistory()
    
    init() {
        stock.add(BananaMilk())
        stock.add(BananaMilk())
        stock.add(ChocoMilk())
        stock.add(ChocoMilk())
        stock.add(Cola())
        stock.add(Cola())
        stock.add(Fanta())
        stock.add(Fanta())
        stock.add(Cantata())
        stock.add(Cantata())
        stock.add(TOP())
        stock.add(TOP())
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin.isEnoughToBuy(of: price)
    }
    
    func searchExpirationList() -> [Beverage] {
        let todayDate: Date = Date()
        return stock.searchExpirationList(to: todayDate)
    }
    
    func getPuchaseHistory() -> [String] {
        return purchaseHistory.convertToStrngHistory()
    }
}

extension VendingMachine: PrintableMachingState {
    func machineState(form: (Coin, Stock) -> Void) {
        form(coin, stock)
    }
}

extension VendingMachine: ManageableMode {
    func addStock(drink: Beverage) {
        stock.add(drink)
    }
    
    func removeDrink(_ menu: Int) -> Beverage {
        return stock.pickOneDrink(menu: menu)
    }
}

extension VendingMachine: UserAvailableMode {
    func IsAbleToinsert(coin: Int) -> State {
        if coin < 0 { return .negative }
        self.coin.add(coin)
        return .success
    }
    
    func isAbleTopick(menu: Int) -> State {
        guard stock.isExist(menu) else { return .notExist }
        guard !stock.isEmptyStock(menu) else { return .notEnough }
        let price = stock.getPrice(menu: menu)
        guard canBuy(price) else { return .fail }
        let drink = stock.pickOneDrink(menu: menu)
        purchaseHistory.addHistory(of: drink)
        coin.minus(price)
        return .success
    }
    
    func pick(menu: Int) -> Beverage {
        let picked = stock.pickOneDrink(menu: menu)
        purchaseHistory.addHistory(of: picked)
        return picked
    }
    
    func insert(coin: Int) {
        self.coin.add(coin)
    }
    
    func getPurchaseListInsertedCoin() -> [String] {
        return stock.getPurchaseList(with: coin)
    }
}
