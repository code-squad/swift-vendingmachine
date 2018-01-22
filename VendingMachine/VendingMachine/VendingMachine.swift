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
    mutating func removeProduct(_ product : String)
    mutating func updateProductNumbersAndKinds()
    func generateListOfHistory() -> [Beverage]
    func getProductName(_ userProductNumber : InputView.ProductNumber) -> String
    func getInventory() -> [String:[Beverage]]
    func generateInvalidProducts() -> [Beverage]
    func generateListOfValidProduct() -> [String]
    func generateBeverageFromProductName(_ productName : String) -> Beverage?
}

protocol UserMode {
    mutating func addMoney(_ userMoney : Int)
    mutating func buy(_ product : String)
    mutating func updateProductNumbersAndKinds()
    func getProductName(_ userProductNumber : InputView.ProductNumber) -> String
    func getInventory() -> [String:[Beverage]]
    func generateInvalidProducts() -> [Beverage]
    func generateListOfValidProduct() -> [String]
    func getBalance() -> Int
}

struct VendingMachine : AdminMode, UserMode {
    
    private var inventory : [String:[Beverage]] = [:]
    private var balance : Int = 0
    private var historyOfProductsSold : [Beverage] = []
    private var productNumbersAndKinds : [Int:String] = [:]
    
    init(productsBox : [Beverage]) {
        for oneProduct in productsBox {
            addBeverage(oneProduct)
        }
        self.updateProductNumbersAndKinds()
    }
    
    mutating func addMoney(_ userMoney : Int) {
        self.balance += userMoney
    }

    mutating func addBeverage(_ product : Beverage) {
        if self.inventory.index(forKey: String(describing: type(of:product).self)) == nil {
            self.inventory.updateValue([product], forKey: String(describing: type(of:product).self))
            return
        }
        self.inventory[String(describing: type(of:product).self)]?.append(product)
    }
    
    func generateListOfValidProduct() -> [String] {
        return self.inventory.filter({$0.value.count > 0}).filter({($0.value[0].price) < self.balance}).map({$0.key})
    }
    
    mutating func buy(_ product : String) {
        let soldProduct = self.inventory[product]?.removeFirst()
        guard let product = soldProduct else { return }
        self.historyOfProductsSold.append(product)
        self.balance -= product.price
    }
    
    func getBalance() -> Int {
        return self.balance
    }
    
    mutating func removeProduct(_ product : String) {
        self.inventory[product]?.removeFirst()
    }
    
    func getInventory() -> [String:[Beverage]] {
        return self.inventory.filter({$0.value.count > 0})
    }
    
    func generateInvalidProducts() -> [Beverage] {
        let kindsOfMilk : [ObjectIdentifier] = [StrawberryMilk.getKind(),BananaMilk.getKind(),ChocolateMilk.getKind()]
        let milkProducts = self.inventory.map({$0.value.filter({kindsOfMilk.contains(ObjectIdentifier(type(of:$0)))})})
        let invalidProducts = milkProducts.map({$0.filter({($0 as! Milk).validate(with: Date()) == false})})
        return Array(invalidProducts.filter({!$0.isEmpty}).joined())
    }
    
    func generateHotProducts() -> [Beverage] {
        let kindsOfCoffee : [ObjectIdentifier] = [TOPCoffee.getKind(),Cantata.getKind(),Georgia.getKind()]
        let coffeeProducts = self.inventory.map({$0.value.filter({kindsOfCoffee.contains(ObjectIdentifier(type(of:$0)))})})
        let hotProducts = coffeeProducts.map({$0.filter({($0 as! Coffee).isHot()})})
        return Array(hotProducts.filter({$0.isEmpty == false}).joined())
    }
    
    func generateListOfHistory() -> [Beverage] {
        return self.historyOfProductsSold
    }
    
    func getProductName(_ userProductNumber : InputView.ProductNumber) -> String {
        return self.productNumbersAndKinds[userProductNumber.rawValue] ?? ""
    }
    
    mutating func updateProductNumbersAndKinds() {
        var productNumber = 1
        for oneProduct in self.getInventory().keys {
            self.productNumbersAndKinds.updateValue(oneProduct, forKey: productNumber)
            productNumber += 1
        }
    }
    
    func generateBeverageFromProductName(_ productName : String) -> Beverage? {
        switch productName {
        case String(describing: type(of:StrawberryMilk().self)) : return StrawberryMilk()
        case String(describing: type(of:BananaMilk().self)) : return BananaMilk()
        case String(describing: type(of:PepciCoke().self)) : return PepciCoke()
        case String(describing: type(of:Fanta().self)) : return Fanta()
        case String(describing: type(of:TOPCoffee().self)) : return TOPCoffee()
        case String(describing: type(of:Georgia().self)) : return Georgia()
        default:
            break
        }
        return nil
    }
    
}
