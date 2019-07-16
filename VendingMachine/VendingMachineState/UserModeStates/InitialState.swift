//
//  InitialState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class InitialState: StateTransitionable {
    var vendingMachine: VendingMachine
    
    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(self.vendingMachine.readyState, from: StateType.initialize)
    }
    
    func implementStateInstruction() -> InstructionResult {
        moveToNextState(nextTo: vendingMachine.readyState)
        return InstructionResult(nil, nil)
    }
}
