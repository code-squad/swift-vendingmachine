//
//  VendingMachineAdmin.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachineAdmin : AdminMode {
    
    private var vendingMachine : AdminMode
    
    init(_ machine : AdminMode) {
        self.vendingMachine = machine
    }
    
    mutating func addBeverage(_ product: Beverage) {
        self.vendingMachine.addBeverage(product)
    }
    
    mutating func removeProduct(_ product: String) {
        self.vendingMachine.removeProduct(product)
    }
    
    func generateListOfHistory() -> [Beverage] {
        return self.vendingMachine.generateListOfHistory()
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
        return self.vendingMachine.getInventory().filter({$0.value.count > 0}).map({$0.key})
    }
    
    func generateBeverageFromProductName(_ productName: String) -> Beverage? {
        return self.vendingMachine.generateBeverageFromProductName(productName)
    }
    
}
