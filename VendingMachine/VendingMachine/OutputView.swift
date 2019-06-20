//
//  OutputView.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printMenuInputGuidance (_ vendingMachine: VendingMachine) {
        print("현재 투입한 금액이 \(vendingMachine.getBalance())원입니다. 다음과 같은 음료가 있습니다.")
        print("=> ", terminator: "")
        let drinks = vendingMachine.getStockList()
        for (name, amount) in drinks {
            print("\(name)(\(amount)) ", terminator: "")
        }
        
        print("\n1. 금액추가")
        print("2. 음료구매")
        print("0. 종료")
        
        print("> ", terminator: "")
    }
    
    static func printBuyableDrinkList (_ vendingMachine: VendingMachine) throws {
        let buyableDrinkList = vendingMachine.getBuyableDrinkList()
        if buyableDrinkList.count == 0 {
            throw BuyError.NotEnoughBalance
        }
        
        for (index, drink) in buyableDrinkList.enumerated() {
            print("\(index+1)) \(drink) \(drink.getPrice())원")
        }
    }
    
    static func printInsertCoinGuidance () {
        print("넣을 금액을 입력해주세요.")
    }
    
    static func print(_ ment: String) {
        print(ment)
    }
}
