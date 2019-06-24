//
//  OutputView.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printMenuInputGuidance (_ vendingMachine: VendingMachineForUser) {
        print("현재 투입한 금액이 \(vendingMachine.getBalance())원입니다. 다음과 같은 음료가 있습니다.")
        print("=> ", terminator: "")
        let drinks = vendingMachine.getStockList()
        for (name, amount) in drinks {
            print("\(name)(\(amount)) ", terminator: "")
        }
        
        print(Ment.menuInputGuidance.rawValue, terminator: "")
    }
    
    static func printBuyableDrinkList (_ vendingMachine: VendingMachineForUser) throws {
        let buyableDrinkList = vendingMachine.getBuyableDrinkList()
        if buyableDrinkList.count == 0 {
            throw BuyError.NotEnoughBalance
        }
        
        for (index, drink) in buyableDrinkList.enumerated() {
            print("\(index+1)) \(drink) \(drink.getPrice())원")
        }
    }
    
    static func printInsertCoinGuidance () {
        print(Ment.insertCoinGuidance.rawValue)
    }
    
    static func printVendingMachineStart () {
        print(Ment.vendingMachineStart.rawValue)
    }
    
    static func printMent(_ ment: String) {
        print(ment)
    }
    
    static func printDrinks (_ drinks: [Drink]) {
        for (index, drink) in drinks.enumerated() {
            print("\(index+1) - \(drink)")
        }
    }
    
    static func printStock (_ stock: [Drink:Int]) {
        for (drink, count) in stock {
            print("\(drink) - \(count)개")
        }
    }
    
    static func printMenuGuide (_ menu: [Int:String]) {
        for (index, guide) in menu {
            print("\(index) : \(guide)")
        }
    }
}
