//
//  SoldState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class SoldState: StateTransitionable{
    
    var vendingMachine: VendingMachine

    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func moveToNextState() {
        
    }
    
    func insertMoney(money: Int) {
        vendingMachine.chargeBalance(money)
    }
    
    func selectDrinkNumber(number: Int, quantity: Int = 1) {
        vendingMachine.sellProduct(productId: number)
    }
    
    func implementStateInstruction() {
        
    }
}
