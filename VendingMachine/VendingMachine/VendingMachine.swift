//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
typealias productKind = String

protocol AdminMode {
    mutating func addBeverage(_ product : Beverage)
    mutating func removeProduct(_ product : ObjectIdentifier) -> Beverage?
    mutating func updateProductNumbersAndKinds()
    func generateListOfHistory() -> [Beverage]
    func getProductName(_ userProductNumber : InputView.ProductNumber) -> ObjectIdentifier?
    func getInventory() -> [ObjectIdentifier:[Beverage]]
    func generateInvalidProducts() -> [Beverage]
    func generateListOfProduct() -> [ObjectIdentifier]
    func generateBeverageFromProductName(_ productNumber : ObjectIdentifier) -> Beverage?
}

protocol UserMode {
    mutating func addMoney(_ userMoney : Int)
    mutating func buy(_ product : Beverage)
    mutating func updateProductNumbersAndKinds()
    func getProductName(_ userProductNumber : InputView.ProductNumber) -> ObjectIdentifier?
    func getInventory() -> [ObjectIdentifier:[Beverage]]
    func generateInvalidProducts() -> [Beverage]
    func generateListOfValidProduct() -> [ObjectIdentifier]
    func getBalance() -> Int
}

struct VendingMachine : AdminMode, UserMode {
    
    private var inventory : Inventory = Inventory([])
    private var balance : Int = 0
    private var historyOfProductsSold : [Beverage] = []
    private var productNumbersAndKinds : [Int:ObjectIdentifier] = [:]
    
    init(productsBox : [Beverage]) {
        for oneProduct in productsBox {
            self.inventory.addBeverage(oneProduct)
        }
        self.updateProductNumbersAndKinds()
    }
    
    mutating func addBeverage(_ product: Beverage) {
        self.inventory.addBeverage(product)
    }
    mutating func addMoney(_ userMoney : Int) {
        self.balance += userMoney
    }
    
    func generateListOfValidProduct() -> [ObjectIdentifier] {
        return self.inventory.getInventory().filter({$0.value.count > 0}).filter({($0.value[0].price) < self.balance}).map({$0.key})
    }
    
    mutating func buy(_ product : Beverage) {
        let soldProduct = self.removeProduct(ObjectIdentifier(type(of:product)))
        guard let product = soldProduct else { return }
        self.historyOfProductsSold.append(product)
        self.balance -= product.price
    }
    
    func getBalance() -> Int {
        return self.balance
    }
    
    mutating func removeProduct(_ product: ObjectIdentifier) -> Beverage?{
        return self.inventory.removeBeverage(product)
    }
    
    func getInventory() -> [ObjectIdentifier:[Beverage]] {
        return self.inventory.getInventory().filter({$0.value.count > 0})
    }
    
    func generateInvalidProducts() -> [Beverage] {
        let kindsOfMilk : [ObjectIdentifier] = [StrawberryMilk.getKind(),BananaMilk.getKind(),ChocolateMilk.getKind()]
        let milkProducts = self.inventory.getInventory().map({$0.value.filter({kindsOfMilk.contains(ObjectIdentifier(type(of:$0)))})})
        let invalidProducts = milkProducts.map({$0.filter({($0 as! Milk).validate(with: Date()) == false})})
        return Array(invalidProducts.filter({!$0.isEmpty}).joined())
    }
    
    func generateHotProducts() -> [Beverage] {
        let kindsOfCoffee : [ObjectIdentifier] = [TOPCoffee.getKind(),Cantata.getKind(),Georgia.getKind()]
        let coffeeProducts = self.inventory.getInventory().map({$0.value.filter({kindsOfCoffee.contains(ObjectIdentifier(type(of:$0)))})})
        let hotProducts = coffeeProducts.map({$0.filter({($0 as! Coffee).isHot()})})
        return Array(hotProducts.filter({$0.isEmpty == false}).joined())
    }
    
    func generateListOfHistory() -> [Beverage] {
        return self.historyOfProductsSold
    }
    
    func generateListOfProduct() -> [ObjectIdentifier] {
        return self.getInventory().filter({$0.value.count > 0}).map({$0.key})
    }
    
    func getProductName(_ userProductNumber : InputView.ProductNumber) -> ObjectIdentifier? {
        return self.productNumbersAndKinds[userProductNumber.rawValue] ?? ObjectIdentifier(type(of:Beverage.self))
    }
    
    mutating func updateProductNumbersAndKinds() {
        var productNumber = 1
        for oneProduct in self.getInventory().keys {
            self.productNumbersAndKinds.updateValue(oneProduct, forKey: productNumber)
            productNumber += 1
        }
    }
    
    func generateBeverageFromProductName(_ productName : ObjectIdentifier) -> Beverage? {
        return self.getInventory()[productName]?.last
    }
    
}
