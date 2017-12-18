//
//  OutputView.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct OutputView {
    static func printSelectMenu() {
        print("1. 금액추가")
        print("2. 음료구매")
    }
    
    static private func printBalance(_ machine: VendingMachine) {
        print("")
        print("현재 투입한 금액은 \(machine.getBalance())원 입니다.", terminator: "")
        print("다음과 같은 음료가 있습니다.")
    }
    
    static func printMainMenu(machine: VendingMachine) {
        printBalance(machine)
        print("\n")
        for element in machine.getStockList() {
            print("\(element.key.name)(\(element.value)개)  ", terminator:"")
        }
        print("\n")
    }
    
    static func printAfterInsertMoney(machine: VendingMachine) {
        printBalance(machine)
        for element in machine.getStockList() {
            print("\(element.key.name)\(element.key.price)원 (\(element.value)개)")
        }
    }
    
    static func printAfterBuyingBeverage(beverage: Beverage) {
        print("\(beverage.name)를 구매하셨습니다. \(beverage.price)원을 차감합니다.")
    }
    
    static func printError(_ error: String) {
        print(error)
    }
}
