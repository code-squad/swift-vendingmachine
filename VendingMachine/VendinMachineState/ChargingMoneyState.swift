//
//  ChargeMoneyState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChargingMoneyState: StateTransitionable{
    private var chargableMoney : Int = 0
    var vendingMachine : VendingMachine
    
    init(machine: VendingMachine){
        vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .ready)
    }
    
    func implementStateInstruction() {
        do {
            try insertMoney(self.chargableMoney)
        } catch let error as VendingMachineError{
            print(error.description)
        } catch {
            print(VendingMachineError.unknownError)
        }
        resetCurrentMoney()
        moveToNextState(nextTo: self.vendingMachine.readyState)
    }
    
    func receiveMoneyInput(_ money: Int){
        self.chargableMoney = money
    }
    
    private func insertMoney(_ money: Int) throws {
        if money <= 0 {
            throw VendingMachineError.invalidChargeMoney
        }
        self.vendingMachine.chargeBalance(money)
    }
    
    private func resetCurrentMoney(){
        self.chargableMoney = 0
    }
}
