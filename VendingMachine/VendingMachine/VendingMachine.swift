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
    private var drinks: [Beverage] = []
    
    init() {
        coin = 0
        drinks.append(BananaMilk(name: "서울우유", volume: 200, brand: "빙그레바나나우유", date: "20190220", fat: true, bananaAmount: 1.1))
        drinks.append(ChocoMilk(name: "부산우유", volume: 250, brand: "빙그레초코우유", date: "20190303", fat: true, cocoaAmount: 1.3))
        drinks.append(ChocoMilk(name: "남양우유", volume: 230, brand: "빙그레초코우유", date: "20190303", fat: false, cocoaAmount: 1.2))
        drinks.append(Cola(name: "펩시", volume: 350, brand: "다이어트콜라", date: "20190707", isZeroCalorie: false, sugarAmount: 0.9))
        drinks.append(Fanta(name: "환타", volume: 350, brand: "다이어트환타", date: "20191009", isZeroCalorie: false, fantaFlavor: .grape))
    }
    
    func insert(coin: Int) {
        self.coin += coin
    }
    
    func sell(menu: Int) {
        guard let menu = DrinkMenu(rawValue: menu) else { return }
        switch menu {
        case .bananaMilk:
            for index in 0..<drinks.count {
                if drinks[index] is BananaMilk && canBuy(drinks[index].price) {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                    break
                }
            }
        case .chocoMilk:
            for index in 0..<drinks.count {
                if drinks[index] is ChocoMilk && canBuy(drinks[index].price) {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                    break
                }
            }
        case .cola:
            for index in 0..<drinks.count {
                if drinks[index] is Cola && canBuy(drinks[index].price) {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                    break
                }
            }
        case .fanta:
            for index in 0..<drinks.count {
                if drinks[index] is Fanta && canBuy(drinks[index].price) {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                    break
                }
            }
        case .cantata:
            for index in 0..<drinks.count {
                if drinks[index] is Cantata && canBuy(drinks[index].price) {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                    break
                }
            }
        case .top:
            for index in 0..<drinks.count {
                if drinks[index] is TOP && canBuy(drinks[index].price) {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                    break
                }
            }
        }
    }
    
    private func canBuy(_ price: Int) -> Bool {
        return coin >= price
    }
    
    func add(drink: Beverage) {
        drinks.append(drink)
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
        
        for drink in drinks { if drink.menufactureOfDate < todayDate { past.append(drink) } }
        return past
    }
}

extension VendingMachine {
    func machineState(form: (Int, (Int, Int, Int, Int, Int, Int)) -> Void) {
        form(coin, countDrinks())
    }
    
    private func countDrinks() -> (Int, Int, Int, Int, Int, Int) {
        var count: (banana: Int, choco: Int, cola: Int, fanta: Int, cantata: Int, top: Int) = (0, 0, 0, 0, 0, 0)
        for drink in drinks {
            switch drink {
            case is BananaMilk: count.banana += 1
            case is ChocoMilk: count.choco += 1
            case is Cola: count.cola += 1
            case is Fanta: count.fanta += 1
            case is Cantata: count.cantata += 1
            case is TOP: count.top += 1
            default: break
            }
        }
        return count
    }
}

protocol PrintableMachingState {
    func machineState(form: (Int, (Int, Int, Int, Int, Int, Int)) -> Void)
}
