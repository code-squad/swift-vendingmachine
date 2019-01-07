//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine : PrintableMachingState {
    private var coin: Int
    private var drinks: [[Beverage]] = [[]]
    
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
    
    func sell(menu: Int) -> State {
        guard let menu = DrinkMenu(rawValue: menu) else { return .notExist }
        switch menu {
        case .bananaMilk: return removeDrink(index: 0)
        case .chocoMilk: return removeDrink(index: 1)
        case .cola: return removeDrink(index: 2)
        case .fanta: return removeDrink(index: 3)
        case .cantata: return removeDrink(index: 4)
        case .top: return removeDrink(index: 5)
        }
    }
    
    private func removeDrink(index: Int) -> State {
        guard !drinks[index].isEmpty else { return .notEnough }
        guard canBuy(drinks[index][0].price) else { return .fail }
        coin -= drinks[index][0].price
        drinks[index].remove(at: 0)
        return .success
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin >= price
    }
    
    func canPurchaseList() -> String {
        var list: String = ""
        if coin >= 1500 { list += "1) 바나나우유\n2) 초코우유\n" }
        if coin >= 2000 { list += "3) 콜라\n4) 환타\n"}
        if coin >= 3000 { list += "5) 칸타타\n"}
        if coin >= 3500 { list += "6) TOP\n"}
        return list
    }
    
    func getExpirationList() -> [Beverage] {
        var past: [Beverage] = []
        let todayDate: Date = Date()
        for drinkKind in drinks {
            for drink in drinkKind {
                if drink.menufactureOfDate < todayDate { past.append(drink) }
            }
        }
        return past
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
}

protocol PrintableMachingState {
    func machineState(form: (Int, Dictionary<String, Int>) -> Void)
}
