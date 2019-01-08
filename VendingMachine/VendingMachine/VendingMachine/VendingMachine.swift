//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine : PrintableMachingState {
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
    
    func insert(coin: Int) -> State {
        if coin < 0 { return .negative }
        self.coin.add(coin)
        return .success
    }
    
    func pick(menu: Int) -> State {
        if !stock.isExist(menu) { return .notExist }
        return removeDrink(index: menu)
    }
    
    private func removeDrink(index: Int) -> State {
        guard !stock.isEmptyStock(index) else { return .notEnough }
        let price = stock.getPrice(menu: index)
        guard canBuy(price) else { return .fail }
        purchaseHistory.addHistory(of: stock.pickOneDrink(menu: index))
        coin.minus(price)
        return .success
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin.isEnoughToBuy(of: price)
    }
    
    func getPurchaseListInsertedCoin() -> [String] {
        return stock.getPurchaseList(with: coin)
    }
    
    func searchExpirationList() -> [Beverage] {
        let todayDate: Date = Date()
        return stock.searchExpirationList(to: todayDate)
    }
    
    func addStock(drink: Beverage) {
        stock.add(drink)
    }
    
    func getPuchaseHistory() -> [String] {
        return purchaseHistory.convertToStrngHistory()
    }
}

extension VendingMachine {
    func machineState(form: (Coin, Stock) -> Void) {
        form(coin, stock)
    }
}

protocol PrintableMachingState {
    func machineState(form: (Coin, Stock) -> Void)
}
