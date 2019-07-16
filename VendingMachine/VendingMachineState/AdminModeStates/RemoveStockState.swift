//
//  RemoveStockState.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class RemoveStockState: StateTransitionable, StockManipulatable{
    private var quantity: Int!
    private var number: Int!
    var vendingMachine: VendingMachine
    
    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .ready)
    }
    
    func implementStateInstruction() -> InstructionResult {
        
        return InstructionResult("", nil)
    }
    
    func receiveDrinkNumberQuantity(num: Int, quantity: Int) {
        self.number = num
        self.quantity = quantity
    }
}

