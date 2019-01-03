//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine : PrintableMachingState {
    private var insertCoin: Int = 0
    private var drinks: [Beverage] = []
}

extension VendingMachine {
    func machineState(form: (Int, (Int, Int, Int, Int, Int, Int)) -> Void) {
        form(insertCoin, countDrinks())
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
