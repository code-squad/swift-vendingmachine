//
//  AddStockState.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AddStockState: StateTransitionable, StockManipulatable{
    private var quantity: Int!
    private var number: Int!
    var vendingMachine: VendingMachine

    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .addStock)
    }
    
    func implementStateInstruction() -> InstructionResult {
        do {
            let drink = try self.vendingMachine.selectProduct(productId: self.number)
            drink.updateDateInfo(days: 90)
            try self.vendingMachine.addDrinkStock(drink, quantity: self.quantity)
            moveToNextState(nextTo: vendingMachine.adminReadyState)
            guard let quantity = self.quantity else {
                return InstructionResult(nil, .invalidDrinkQuantity)
            }
            let addStockResult = AuxiliaryStockStateModifying.displayModifiedInfo(drink, quantity: quantity)
            return addStockResult
        }catch let error as VendingMachineError{
            return InstructionResult(nil, error)
        }catch{
            return InstructionResult(nil, .unknownError)
        }
    }
    
    func receiveDrinkNumberQuantity(num: Int, quantity: Int) {
        self.number = num
        self.quantity = quantity
    }
}
