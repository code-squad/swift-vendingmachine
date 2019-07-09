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
    
    func moveToNextState() {
        vendingMachine.changeState(vendingMachine.readyState)
    }
    
    func implementStateInstruction() {
        
    }
}
