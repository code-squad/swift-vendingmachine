//
//  AddStockState.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AddStockState: StateTransitionable{
    func moveToNextState(nextTo: StateTransitionable) {
        
    }
    
    func implementStateInstruction() -> InstructionResult {
        return InstructionResult("", nil)
    }
    
    var vendingMachine: VendingMachine
    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
}
