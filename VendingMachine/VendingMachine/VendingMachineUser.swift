//
//  VendingMachineUser.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachineUser : UserMode{
    private var vendingMachine : UserMode
    
    init(_ machine : UserMode) {
        self.vendingMachine = machine
    }
    
    mutating func addMoney(_ userMoney: Int) {
        self.vendingMachine.addMoney(userMoney)
    }
    
    mutating func buy(_ product: String) {
        self.vendingMachine.buy(product)
    }
    
    mutating func updateProductNumbersAndKinds() {
        self.vendingMachine.updateProductNumbersAndKinds()
    }
    
    func getProductName(_ userProductNumber: InputView.ProductNumber) -> String {
        return self.vendingMachine.getProductName(userProductNumber)
    }
    
    func getInventory() -> [String : [Beverage]] {
        return self.vendingMachine.getInventory()
    }
    
    func generateInvalidProducts() -> [Beverage] {
        return self.vendingMachine.generateInvalidProducts()
    }
    
    func generateListOfValidProduct() -> [String] {
        return self.vendingMachine.generateListOfValidProduct()
    }
    
    func getBalance() -> Int {
        return self.vendingMachine.getBalance()
    }

}
