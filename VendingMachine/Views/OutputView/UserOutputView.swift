//
//  OutputView.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class UserOutputView {
    
    static func printBeverage(_ drink: Drinkable){
        let output = { (_ drink:  Drinkable) in
            print(drink)
        }
        drink.display(printFormat: output)
    }
    
    static func showCurrentBalanceInfo(_ vendingmachine: VendingMachine) {
        let printBalanceFormat = { (balance: Int) in
            print("현재 투입한 금액이 \(balance)원입니다.", terminator: " ")
            print("다음과 같은 음료가 있습니다.\n")
        }
        vendingmachine.showCurrentBalanceInfo(printFormat: printBalanceFormat)
    }
    
    static func selectMenuInfo(){
        print("\(StateType.chargeMoney.description)")
        print("\(StateType.sell.description)")
        print("\(StateType.modeSelect.description)")
    }
    
    static func printSellingMessage(name : String, price: String){
        print("\(name)을 구매하셨습니다. \(price)원을 차감합니다")
    }
   
}
