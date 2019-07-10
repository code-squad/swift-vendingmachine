//
//  OutputView.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class OutputView {
    
    static func printBeverage(_ drink: Drinkable){
        let output = { (_ drink:  Drinkable) in
            print(drink)
        }
        drink.display(printFormat: output)
    }
    
    static func printDrinkMenuListWithNumber (_ vendingmachine: VendingMachine){
        let drinkStockInfoFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
                sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                    print("\(key)) \(value.description) ")
            }
        }
        vendingmachine.displayDrinkMenuList(printFormat: drinkStockInfoFormat)
    }
    static func printInitialDrinkMenuList(_ vendingmachine: VendingMachine){
        let printDrinkMenuListFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
                sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                    print( "\(value.drinkName)(\(value.drinkStockList.count)개)", separator: " ")
            }
        }
        vendingmachine.displayDrinkMenuList(printFormat: printDrinkMenuListFormat)
    }
    static func showCurrentBalanceInfo(_ vendingmachine: VendingMachine) {
        let printBalanceFormat = { (balance: Int) in
            print("현재 투입한 금액이 \(balance)원입니다.", separator: "")
            print("다음과 같은 음료가 있습니다.")
        }
        vendingmachine.showCurrentBalanceInfo(printFormat: printBalanceFormat)
    }
}
