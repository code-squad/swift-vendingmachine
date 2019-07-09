//
//  ChargeMoneyState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChargeMoneyState: StateTransitionable{
    var vendingMachine : VendingMachine
    
    init(machine: VendingMachine){
        vendingMachine = machine
    }
    func moveToNextState() {
        
    }
    func implementStateInstruction() {
        
    }
}
