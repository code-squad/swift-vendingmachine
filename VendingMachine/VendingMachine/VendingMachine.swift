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
    private var drinksStocks: DrinkStocks = DrinkStocks()
    private var purchaseHistory: PurchaseHistory = PurchaseHistory()
    
    func insert(coin: Int) -> State {
        if coin < 0 { return .negative }
        self.coin.add(coin)
        return .success
    }
    
    func pick(menu: Int) -> State {
        if !drinksStocks.isExist(menu) { return .notExist }
        return removeDrink(index: menu)
    }
    
    private func removeDrink(index: Int) -> State {
        guard !drinksStocks.isEmptyStock(index) else { return .notEnough }
        let price = drinksStocks.getPrice(menu: index)
        guard canBuy(price) else { return .fail }
        purchaseHistory.addHistory(of: drinksStocks.pickOneDrink(menu: index))
        coin.minus(price)
        return .success
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin.isEnoughToBuy(of: price)
    }
    
    func getPurchaseListInsertedCoin() -> [String] {
        return drinksStocks.getPurchaseList(with: coin)
    }
    
    func searchExpirationList() -> [Beverage] {
        let todayDate: Date = Date()
        return drinksStocks.searchExpirationList(to: todayDate)
    }
    
    func addStock(drink: Beverage) {
        drinksStocks.add(drink)
    }
    
    func getPuchaseHistory() -> [String] {
        return purchaseHistory.convertToStrngHistory()
    }
}

extension VendingMachine {
//    func machineState(form: (Coin, Dictionary<String, Int>) -> Void) {
//        form(coin, drinksStocks.count())
//    }
    
    func machineState(form: (Coin, DrinkStocks) -> Void) {
        form(coin, drinksStocks)
    }
}

protocol PrintableMachingState {
//    func machineState(form: (Coin, Dictionary<String, Int>) -> Void)
    func machineState(form: (Coin, DrinkStocks) -> Void)
}
