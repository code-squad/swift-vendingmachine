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
    init(machine: VendingMachine){
        vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .ready)
    }
    
    func implementStateInstruction() {
        if self.vendingMachine.fromState != StateType.initialize {
            OutputView.showCurrentBalanceInfo(self.vendingMachine)
            OutputView.printDrinkMenuListWithNumber(self.vendingMachine)
        }
        OutputView.selectMenuInfo()
        guard let pair = readInstruction() else {
            return
        }
        let stateType = StateType.init(value: pair.instruction)
        switch stateType {
        case .chargeMoney:
           shiftChargeMoneyStateWithMoney(pair.quantity)
        case .sell:
            shiftSellingStateWithDrinkNumber(pair.quantity)
        default:
            return
        }
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
    
    private func readInstruction() -> (instruction: Int, quantity: Int)?{
        do {
            let instructionPair = try InputView.readInstruction()
            return instructionPair
        }catch(let errorType as VendingMachineError) {
            OutputView.printErrorMessage(errorType)
        }catch {
            OutputView.printErrorMessage(.unknownError)
        }
        return nil
    }
}
