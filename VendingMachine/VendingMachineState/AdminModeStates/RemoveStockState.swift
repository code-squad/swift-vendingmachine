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
            let removeStock = try self.vendingMachine.removeDrinkStock(number: number, quantity: self.quantity)
            self.quantity = removeStock.actualRemoved
            moveToNextState(nextTo: vendingMachine.adminReadyState)
            let removeStockResult = AuxiliaryStockStateModifying.displayModifiedInfo(drink, quantity: self.quantity!)
            return removeStockResult
        }catch let error as VendingMachineError{
            return InstructionResult(nil, error)
        }catch{
            return InstructionResult(nil, .unknownError)
        }
    }
  
//    private func displayModifiedInfo(_ drink: Drink) -> InstructionResult{
//        let drinkItemInfoFormat = { (name: String) -> (String?, VendingMachineError?) in
//            return InstructionResult("\(name), \(self.quantity!)", nil)
//        }
//        let removeStockResult = drink.displayModifiedStock(format: drinkItemInfoFormat)
//        return removeStockResult
//    }
    
    func receiveDrinkNumberQuantity(num: Int, quantity: Int) {
        self.number = num
        self.quantity = quantity
    }
}

