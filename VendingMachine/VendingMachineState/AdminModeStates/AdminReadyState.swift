//
//  AdminReadyState.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AdminReadyState: StateTransitionable{
    private var instruction: Int!
    private var quantity: Int!
    private var number: Int!
    
    var vendingMachine: VendingMachine
    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .adminReady)
    }
    
    func implementStateInstruction() -> InstructionResult{
        let printableMessage: String = displayVendingMachineInfo()
        let stateType = AdminStateType.init(value: self.instruction)
        switch stateType {
        case .addStock:
            shiftAddStockStateWithDrinkNumber(number: self.number, quantity: self.quantity)
        case .removeStock:
            shiftRemoveStockStateWithDrinkNumber(number: self.number, quantity: self.quantity)
        case .modeSelect:
            shiftModeSelectState()
        default:
            break
        }
        return InstructionResult(printableMessage, nil)
    }
    
    private func shiftModeSelectState(){
        moveToNextState(nextTo: self.vendingMachine.modeSelectState)
    }
    
    func receiveInstruction(instruction: Int) {
        self.instruction = instruction
    }
    
    func receiveDrinkStcokInstruction(number: Int, quantity: Int) {
        self.number = number
        self.quantity = quantity
    }
    
    private func displayVendingMachineInfo() -> String{
        let message = "\(StateType.addStock.description)\n\(StateType.cleanEarning.description)\n\(StateType.modeSelect.description)"
        return message
    }
    
    private func shiftRemoveStockStateWithDrinkNumber(number: Int, quantity: Int){
        moveToNextState(nextTo: self.vendingMachine.removeStockState)
        guard let nextState = self.vendingMachine.removeStockState as? RemoveStockState else {
            return
        }
        nextState.receiveDrinkNumberQuantity(num: number, quantity: quantity)
    }
    
    private func shiftAddStockStateWithDrinkNumber(number: Int, quantity: Int){
        moveToNextState(nextTo: self.vendingMachine.addStockState)
        guard let nextState = self.vendingMachine.addStockState as? AddStockState else {
            return
        }
        nextState.receiveDrinkNumberQuantity(num: number, quantity: quantity)
    }
}
