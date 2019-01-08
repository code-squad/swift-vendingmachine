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
//    private var drinkStocks: [[Beverage]] = []
    
    init() {
//        drinkStocks.append(Array<Beverage>())            // 바나나우유 재고
//        drinkStocks.append(Array<Beverage>())            // 초코우유 재고
//        drinkStocks.append(Array<Beverage>())            // 콜라 재고
//        drinkStocks.append(Array<Beverage>())            // 환타 재고
//        drinkStocks.append(Array<Beverage>())            // 칸타타 재고
//        drinkStocks.append(Array<Beverage>())            // TOP 재고
    
//        drinkStocks[0].append(BananaMilk(name: "서울우유", volume: 200, brand: "빙그레바나나우유", date: "20190220", fat: true, bananaAmount: 1.1))
//        drinkStocks[1].append(ChocoMilk(name: "부산우유", volume: 250, brand: "빙그레초코우유", date: "20190303", fat: true, cocoaAmount: 1.3))
//        drinkStocks[1].append(ChocoMilk(name: "남양우유", volume: 230, brand: "빙그레초코우유", date: "20190303", fat: false, cocoaAmount: 1.2))
//        drinkStocks[2].append(Cola(name: "펩시", volume: 350, brand: "다이어트콜라", date: "20190707", isZeroCalorie: false, sugarAmount: 0.9))
//        drinkStocks[3].append(Fanta(name: "환타", volume: 350, brand: "다이어트환타", date: "20191009", isZeroCalorie: false, fantaFlavor: .grape))
    }
    
    func insert(coin: Int) -> State {
        if coin < 0 { return .negative }
        self.coin.add(coin)
        return .success
    }
    
    func pick(menu: Int) -> State {
        if menu > drinkStocks.count { return .notExist }
        return removeDrink(index: menu-1)
    }
    
    private func removeDrink(index: Int) -> State {
        guard !drinkStocks[index].isEmpty else { return .notEnough }
        guard canBuy(drinkStocks[index][0].price) else { return .fail }
        purchaseHistory.addHistory(of: drinkStocks[index][0])
        coin.minus(drinkStocks[index][0].price)
        drinkStocks[index].remove(at: 0)
        return .success
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin.isEnoughToBuy(of: price)
    }
    
    func canPurchaseList() -> [String] {
        var purchaseList: [String] = []
        for stock in drinkStocks {
            if !stock.isEmpty {
                if let canBuyDrink = stock[0].getTypeWhatCanBuy(coin: self.coin) { purchaseList.append(canBuyDrink) }
            }
        }
        return purchaseList
    }
    
    func searchExpirationList() -> [Beverage] {
        var past: [Beverage] = []
        let todayDate: Date = Date()
        for drinkKind in drinkStocks {
            for drink in drinkKind {
                if drink.menufactureOfDate < todayDate { past.append(drink) }
            }
        }
        return past
    }
    
    func addStock(drink: Beverage) {
        let drinkNumber = drink.searchDrinkNumber()
        drinkStocks[drinkNumber].append(drink)
    }
    
    func getPuchaseHistory() -> [String] {
        return purchaseHistory.convertToStrngHistory()
    }
}

extension VendingMachine {
    func machineState(form: (Coin, Dictionary<String, Int>) -> Void) {
        form(coin, countDrinkStocks())
    }
    
    private func countDrinkStocks() -> Dictionary<String, Int> {
        var drinkStock: [String:Int] = ["Banana":0, "Choco":0, "Cola":0, "Fanta":0, "Cantata":0, "Top":0]
        drinkStock.updateValue(drinkStocks[0].count, forKey: "Banana")
        drinkStock.updateValue(drinkStocks[1].count, forKey: "Choco")
        drinkStock.updateValue(drinkStocks[2].count, forKey: "Cola")
        drinkStock.updateValue(drinkStocks[3].count, forKey: "Fanta")
        drinkStock.updateValue(drinkStocks[4].count, forKey: "Cantata")
        drinkStock.updateValue(drinkStocks[5].count, forKey: "Top")
        return drinkStock
    }
}

protocol PrintableMachingState {
    func machineState(form: (Coin, Dictionary<String, Int>) -> Void)
}
