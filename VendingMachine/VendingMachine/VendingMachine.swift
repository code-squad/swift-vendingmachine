//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine : PrintableMachingState {
    private var coin: Int = 0
    private var drinks: [Beverage] = []
    
    func insert(coin: Int) {
        self.coin += coin
    }
    
    func sell(menu: Int) {
        guard let menu = DrinkMenu(rawValue: menu) else { return }
        switch menu {
        case .bananaMilk:
            for index in 0..<drinks.count {
                if drinks[index] is BananaMilk {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                }
            }
        case .chocoMilk:
            for index in 0..<drinks.count {
                if drinks[index] is ChocoMilk {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                }
            }
        case .cola:
            for index in 0..<drinks.count {
                if drinks[index] is Cola {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                }
            }
        case .fanta:
            for index in 0..<drinks.count {
                if drinks[index] is Fanta {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                }
            }
        case .cantata:
            for index in 0..<drinks.count {
                if drinks[index] is Cantata {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                }
            }
        case .top:
            for index in 0..<drinks.count {
                if drinks[index] is TOP {
                    coin -= drinks[index].price
                    drinks.remove(at: index)
                }
            }
        }
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
