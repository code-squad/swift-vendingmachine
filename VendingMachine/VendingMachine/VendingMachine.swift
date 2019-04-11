//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias BuyableResultPrintClosure = (Bool, Int, String) -> Void
typealias allListResultPrintClosure = (String, Int, Bool) -> Void

struct VendingMachine {
    private var money: Int
    private var list: Inventory
    private var history: History
    
    init(startMoney: Int = 0 , list: Inventory) {
        self.money = startMoney
        self.list = list
        self.history = History()
    }
   
    mutating func addMoney(money: Int) -> Bool {
        guard money > 0 else { return false }
        self.money += money
        return true
    }
    
    func add(beverage: Beverage) {
        list.add(beverage: beverage)
    }
    
    func buyAvailableList() -> [Packages] {
        return list.buyAvailableList(money: money)
    }
    
    func buyAvailableHotBeverages() -> [Packages] {
        return list.buyAvailableHotBeverages()
    }
    
    func removeGoBadBeverages() -> [Beverage] {
        return list.removeGoBadBeverages()
    }
    
    mutating func buyBeverage(package: Packages) -> Beverage? {
        guard let beverage = list.remove(select: package) else { return nil }
        money = beverage.subtractPay(pay: money)
        history.update(purchase: beverage)
        
        return beverage
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
    
    func hasEqualHistory(with theOther: History) -> Bool {
        return self.history == theOther
    }
    
    func showList(show: (Int) -> Void) {
        show(money)
    }
    
    func showListOfAll(list show: allListResultPrintClosure) {
        let lists = list.getListOfAll()
        let listBuyable = buyAvailableList()
        for pack in lists {
            let buyable = listBuyable.contains(pack.key)
            show(pack.key.description, pack.value, buyable)
        }
    }
    
    func showListOfBuyable(list show: BuyableResultPrintClosure) {
        let listBuyable = buyAvailableList()
        for (index, packBuyable) in listBuyable.enumerated() {
            let number = index + 1
            let last = (number == listBuyable.count)
            show(last, number, packBuyable.description)
        }
    }
}


