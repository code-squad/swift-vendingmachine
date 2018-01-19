//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
typealias productKind = String

struct VendingMachine {
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
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func addMoney(_ userMoney : Int) {
        self.balance += userMoney
    }

    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    mutating func addBeverage(_ product : Beverage) {
        if self.inventory.index(forKey: String(describing: type(of:product).self)) == nil {
            self.inventory.updateValue([product], forKey: String(describing: type(of:product).self))
            return
        }
        self.inventory[String(describing: type(of:product).self)]?.append(product)
    }
    
    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func generateListOfValidProduct() -> [String] {
        return self.inventory.filter({$0.value.count > 0}).filter({($0.value[0].price) < self.balance}).map({$0.key})
    }
    
    // 음료수를 구매하는 메소드
    mutating func buy(_ product : String) {
        let soldProduct = self.inventory[product]?.removeFirst()
        guard let product = soldProduct else { return }
        self.historyOfProductsSold.append(product)
        self.balance -= product.price
    }
    
    // 잔액을 확인하는 메소드
    func getBalance() -> Int {
        return self.balance
    }
    
    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getInventory() -> [String:[Beverage]] {
        return self.inventory.filter({$0.value.count > 0})
    }
    
    // 유통기한이 지난 재고만 리턴하는 메소드
    func generateInvalidProducts() -> [Beverage] {
        let kindsOfMilk : [ObjectIdentifier] = [StrawberryMilk.getKind(),BananaMilk.getKind(),ChocolateMilk.getKind()]
        let milkProducts = self.inventory.map({$0.value.filter({kindsOfMilk.contains(ObjectIdentifier(type(of:$0)))})})
        let invalidProducts = milkProducts.map({$0.filter({($0 as! Milk).validate(with: Date()) == false})})
        return Array(invalidProducts.filter({!$0.isEmpty}).joined())
    }
    
    // 따뜻한 음료만 리턴하는 메소드
    func generateHotProducts() -> [Beverage] {
        let kindsOfCoffee : [ObjectIdentifier] = [TOPCoffee.getKind(),Cantata.getKind(),Georgia.getKind()]
        let coffeeProducts = self.inventory.map({$0.value.filter({kindsOfCoffee.contains(ObjectIdentifier(type(of:$0)))})})
        let hotProducts = coffeeProducts.map({$0.filter({($0 as! Coffee).isHot()})})
        return Array(hotProducts.filter({$0.isEmpty == false}).joined())
    }
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
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
}
