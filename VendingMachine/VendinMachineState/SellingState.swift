//
//  SoldState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class SellingState: StateTransitionable{
    private var selectNumber : Int = 0
    var vendingMachine: VendingMachine
    
    func receiveDrinkNumberInput(_ number: Int){
        self.selectNumber = number
    }
    
    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func moveToNextState() {
        
    }
    
    func insertMoney(money: Int) {
        vendingMachine.chargeBalance(money)
    }
    
    func selectDrinkNumber(number: Int, quantity: Int = 1) {
        vendingMachine.sellProduct(productId: number)
    }
    
    func implementStateInstruction() {
        
    }
}
