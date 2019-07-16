//
//  DrinkStockTable.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class DrinkItemList : CustomStringConvertible{
    private (set) var drinkStockInfo: BeverageInfo
    private var notForSaleList: [Drink] = [Drink]()
    private (set) var drinkStockList: [Drink] {
        didSet {
            self.drinkStockList.sort{ (first: Drink, second: Drink ) in
                first.date < second.date
            }
        }
    }
    var isEmpty : Bool {
        return self.drinkStockList.isEmpty
    }
    
    init(drinkList: [Drink], stockInfo : BeverageInfo) {
        self.drinkStockList = drinkList
        self.drinkStockInfo = stockInfo
    }
    
    var initialDescription: String {
        return "\(self.drinkStockInfo.name) \(self.drinkStockList.count)"
    }
    
    var description: String {
        return "\(self.drinkStockInfo.name) \(self.drinkStockInfo.price)\(Currency.won) (\(self.drinkStockList.count))"
    }
    
    var drinkName: String {
        return drinkStockInfo.name
    }
    
    func removeFirstElement() -> Drink{
        makeNotForSaleList()
        let element = self.drinkStockList.removeFirst()
        return element
    }
    
    func isAvailable(_ money: Int) -> Bool {
        if self.drinkStockInfo.isPurchasable(money) {
            return true
        }
        return false
    }
    
    func getHotDrinkList() -> [Drink]{
        return self.drinkStockList.filter { (drink) -> Bool in
            return drink.isHot()
        }
    }
    
    func makeNotForSaleList() -> [Drink]{
        for (index, element) in self.drinkStockList.enumerated() {
            if !element.validate(with: Date.init()){
                let notForSale = self.drinkStockList.remove(at: index)
                self.notForSaleList.append(notForSale)
            }else {
                break
            }
        }
        return self.notForSaleList
    }
    
    func addItem(_ drink: Drink, quantity: Int) throws {
        if !self.drinkStockInfo.isSameDrinkGroup(drink) {
            throw VendingMachineError.addDrinkToUnknownMenuNumberError
        }
        for _ in 0..<quantity {
            drinkStockList.append(drink)
        }
    }
}
