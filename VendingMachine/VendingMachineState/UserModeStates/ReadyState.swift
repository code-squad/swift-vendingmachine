//
//  ReadyState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ReadyState: StateTransitionable{
    var vendingMachine : VendingMachine
    private var instruction: Int!
    private var quantity: Int!
    init(machine: VendingMachine){
        vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .ready)
    }
    
    func receiveInstruction(instruction: Int, quantity: Int) {
        self.instruction = instruction
        self.quantity = quantity
    }
    
    func implementStateInstruction() -> InstructionResult{
        let printableMessage: String = displayVendingMachineInfo()
        let stateType = StateType.init(value: instruction)
        switch stateType {
        case .chargeMoney:
            shiftChargeMoneyStateWithMoney(quantity)
        case .sell:
            shiftSellingStateWithDrinkNumber(quantity)
        case .modeSelect:
            shiftModeSelectState()
        default:
            break
        }
        return InstructionResult(printableMessage, nil)
    }
    
    private func displayVendingMachineInfo() -> String{
        let message = "\(StateType.chargeMoney.description)\n\(StateType.sell.description)"
        return message
    }
    
    private func shiftModeSelectState(){
        moveToNextState(nextTo: vendingMachine.modeSelectState)
    }
    
    private func shiftChargeMoneyStateWithMoney(_ money: Int){
        moveToNextState(nextTo: vendingMachine.chargeMoneyState)
        guard let nextState = vendingMachine.chargeMoneyState as? ChargingMoneyState else {
            return
        }
        nextState.receiveMoneyInput(money)
    }
    
    private func shiftSellingStateWithDrinkNumber(_ number: Int){
        moveToNextState(nextTo: vendingMachine.sellingState)
        guard let nextState = vendingMachine.sellingState as? SellingState else {
            return
        }
        nextState.receiveDrinkNumberInput(number)
    }
}
