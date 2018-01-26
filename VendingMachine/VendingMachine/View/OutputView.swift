//
//  OutputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {

    func printBeverageMenu(entireInventory: [ObjectIdentifier : [Beverage]]) {
        for menu in entireInventory {
            let numberOfBeverage = menu.value.count
            print("\(menu.value[0].kindOf)(\(numberOfBeverage)개) ", terminator: "")
        }
        print()
    }
    
    func printMachineModeMenu() {
        print("자판기를 시작합니다.\n1. 관리자 모드\n2. 사용자 모드\n> ", terminator: "")
    }
    
    func menuOfSerialized(entireInventory: [ObjectIdentifier : [Beverage]]) -> [ObjectIdentifier] {
        return entireInventory.map({$0.value.first ?? Beverage()}).sorted(by: {$0.kindOf < $1.kindOf}).map({ObjectIdentifier(type(of: $0))})
    }
    
}
