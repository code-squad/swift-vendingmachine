//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine : PrintableMachingState, ManagebleDrinks {
    private var coin: Int
    private var drinks: [[Beverage]] = [[]]
    private var purchaseHistory: [String] = []
    
    init() {
        coin = 0
        drinks.append(Array<Beverage>())            // 바나나우유 재고
        drinks.append(Array<Beverage>())            // 초코우유 재고
        drinks.append(Array<Beverage>())            // 콜라 재고
        drinks.append(Array<Beverage>())            // 환타 재고
        drinks.append(Array<Beverage>())            // 칸타타 재고
        drinks.append(Array<Beverage>())            // TOP 재고
        
        drinks[0].append(BananaMilk(name: "서울우유", volume: 200, brand: "빙그레바나나우유", date: "20190220", fat: true, bananaAmount: 1.1))
        drinks[1].append(ChocoMilk(name: "부산우유", volume: 250, brand: "빙그레초코우유", date: "20190303", fat: true, cocoaAmount: 1.3))
        drinks[1].append(ChocoMilk(name: "남양우유", volume: 230, brand: "빙그레초코우유", date: "20190303", fat: false, cocoaAmount: 1.2))
        drinks[2].append(Cola(name: "펩시", volume: 350, brand: "다이어트콜라", date: "20190707", isZeroCalorie: false, sugarAmount: 0.9))
        drinks[3].append(Fanta(name: "환타", volume: 350, brand: "다이어트환타", date: "20191009", isZeroCalorie: false, fantaFlavor: .grape))
    }
    
    func insert(coin: Int) -> State {
        if coin < 0 { return .negative }
        self.coin += coin
        return .success
    }
    
    func pick(menu: Int) -> State {
        if menu > 6 { return .notExist }
        return removeDrink(index: menu-1)
    }
    
    private func removeDrink(index: Int) -> State {
        guard !drinks[index].isEmpty else { return .notEnough }
        guard canBuy(drinks[index][0].price) else { return .fail }
        purchaseHistory.append("\(index) 음료 구매")
        coin -= drinks[index][0].price
        drinks[index].remove(at: 0)
        return .success
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin >= price
    }
    
    func canPurchaseList() -> [String] {
        var purchaseList: [String] = []
        for stock in drinks {
            if !stock.isEmpty {
                if let canBuyDrink = stock[0].canBuyThisCoin(coin: self.coin) { purchaseList.append(canBuyDrink) }
            }
        }
        return purchaseList
    }
    
    func searchExpirationList() -> [Beverage] {
        var past: [Beverage] = []
        let todayDate: Date = Date()
        for drinkKind in drinks {
            for drink in drinkKind {
                if drink.menufactureOfDate < todayDate { past.append(drink) }
            }
        }
        return past
    }
    
    func addStock(drink: Beverage) {
        switch drink {
        case is BananaMilk: drinks[0].append(drink)
        case is ChocoMilk: drinks[1].append(drink)
        case is Cola: drinks[2].append(drink)
        case is Fanta: drinks[3].append(drink)
        case is Cantata: drinks[4].append(drink)
        case is TOP: drinks[5].append(drink)
        default: return
        }
    }
    
    func getPuchaseHistory() -> [String] {
        return purchaseHistory
    }
}

extension VendingMachine {
    func machineState(form: (Int, Dictionary<String, Int>) -> Void) {
        form(coin, countDrinkStocks())
    }
    
    private func countDrinkStocks() -> Dictionary<String, Int> {
        var drinkStock: [String:Int] = ["Banana":0, "Choco":0, "Cola":0, "Fanta":0, "Cantata":0, "Top":0]
        drinkStock.updateValue(drinks[0].count, forKey: "Banana")
        drinkStock.updateValue(drinks[1].count, forKey: "Choco")
        drinkStock.updateValue(drinks[2].count, forKey: "Cola")
        drinkStock.updateValue(drinks[3].count, forKey: "Fanta")
        drinkStock.updateValue(drinks[4].count, forKey: "Cantata")
        drinkStock.updateValue(drinks[5].count, forKey: "Top")
        return drinkStock
    }
    
    func caaaa(coin: Int, aa: (Int, Int) -> String) -> String {
        return aa(coin, drinks[0][0].price)
    }
}

protocol PrintableMachingState {
    func machineState(form: (Int, Dictionary<String, Int>) -> Void)
}

protocol ManagebleDrinks {
    func caaaa(coin: Int, aa: (Int ,Int) -> String) -> String
}
