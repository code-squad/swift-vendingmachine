//
//  OutputView.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct OutputView {
    var vendingMachinInfo: VendingMachineGetInfo
    
    init(_ machine: VendingMachineGetInfo) {
        self.vendingMachinInfo = machine
    }
    
    private func printBalance() {
        print("")
        print("현재 투입한 금액은 \(vendingMachinInfo.getBalance())원 입니다.", terminator: "")
        print("다음과 같은 음료가 있습니다.")
    }
    
    func printMainMenu() {
        printBalance()
        print("\n")
        for element in vendingMachinInfo.getStockList() {
            print("\(element.key.name)(\(element.value)개)  ", terminator:"")
        }
        print("\n")
    }
    
    func printAfterInsertMoney() {
        printBalance()
        for element in vendingMachinInfo.getStockList() {
            print("\(element.key.name)\(element.key.price)원 (\(element.value)개)")
        }
    }
    
    func printAfterBuyingBeverage(beverage: Beverage) {
        print("\(beverage.name)를 구매하셨습니다. \(beverage.price)원을 차감합니다.")
    }
    
    func printError(_ error: String) {
        print(error)
    }
    
}
