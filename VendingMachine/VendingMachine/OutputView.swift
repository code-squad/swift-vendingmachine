//
//  OutputView.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct OutputView {    
    func printMainMenu(machine: UserDelegate) {
        printBalance(machine)
        for element in machine.getStockList() {
            print("\(element.key.name)(\(element.value)개)  ", terminator:"")
        }
        print("\n")
    }
    
    func printAfterInsertMoney(machine: UserDelegate) {
        printBalance(machine)
        var index = 1
        for element in machine.getStockList() {
            print("\(index))" + "\(element.key.name) \(element.key.price)원 (\(element.value)개)")
            index += 1
        }
        print("")
    }
    
    private func printBalance(_ machine: UserDelegate) {
        print("")
        print("현재 투입한 금액은 \(machine.getBalance())원 입니다.", terminator: "")
        print("다음과 같은 음료가 있습니다.")
    }
    
    func printAfterBuyingBeverage(beverage: Beverage) {
        print("\(beverage.name)를 구매하셨습니다. \(beverage.price)원을 차감합니다.")
    }
    
}
