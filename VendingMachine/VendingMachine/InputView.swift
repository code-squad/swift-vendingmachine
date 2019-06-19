//
//  InputView.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    private func printMenuInputGuidance (_ vendingMachine: VendingMachine) {
        print("현재 투입한 금액이 \(vendingMachine.getBalance())원입니다. 다음과 같은 음료가 있습니다.")
        print("=> ", terminator: "")
        let drinks = vendingMachine.getStockList()
        for (name, amount) in drinks {
            print("\(name)(\(amount)) ", terminator: "")
        }
        
        print("\n1. 금액추가")
        print("2. 음료구매")
        print("0. 종료")
    }
    
    func readInput (_ vendingMachine: VendingMachine) -> String {
        let menu: String
        
        printMenuInputGuidance(vendingMachine)
        print("> ", terminator: "")
        menu = readLine() ?? "0"
        
        return menu
    }
}
