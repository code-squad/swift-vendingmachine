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
    
    func recieveInstruction(instruction: Int, quantity: Int) {
        self.instruction = instruction
        self.quantity = quantity
    }
    
    func implementStateInstruction() -> InstructionResult{
        let printableMessage: String = displayVendingMachineInfo()
        let stateType = StateType.init(value: self.instruction)
        switch stateType {
        case .chargeMoney:
            shiftChargeMoneyStateWithMoney(self.quantity)
        case .sell:
            shiftSellingStateWithDrinkNumber(self.quantity)
        default:
            break
        }
        return InstructionResult(printableMessage, nil)
    }
    
    private func displayVendingMachineInfo() -> String{
        let message = "\(StateType.chargeMoney.description)\n\(StateType.sell.description)"
        return message
        
    }
    
    private func shiftChargeMoneyStateWithMoney(_ money: Int){
        moveToNextState(nextTo: self.vendingMachine.chargeMoneyState)
        guard let nextState = self.vendingMachine.chargeMoneyState as? ChargingMoneyState else {
            return
        }
        nextState.receiveMoneyInput(money)
    }
    
    private func shiftSellingStateWithDrinkNumber(_ number: Int){
        moveToNextState(nextTo: self.vendingMachine.sellingState)
        guard let nextState = self.vendingMachine.sellingState as? SellingState else {
            return
        }
        nextState.receiveDrinkNumberInput(number)
    }
}
