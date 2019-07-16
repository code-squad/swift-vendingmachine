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
        vendingMachine.changeState(nextTo, from: .removeStock)
    }
    
    func implementStateInstruction() -> InstructionResult {
        do {
            let drink = try self.vendingMachine.selectProduct(productId: self.number)
            drink.updateDateInfo(days: 90)
            try self.vendingMachine.addDrinkStock(drink, quantity: self.quantity)
            moveToNextState(nextTo: vendingMachine.adminReadyState)
        }catch let error as VendingMachineError{
            return InstructionResult(nil, error)
        }catch{
            return InstructionResult(nil, .unknownError)
        }
        return InstructionResult("", nil)
    }
    
    func receiveDrinkNumberQuantity(num: Int, quantity: Int) {
        self.number = num
        self.quantity = quantity
    }
}

