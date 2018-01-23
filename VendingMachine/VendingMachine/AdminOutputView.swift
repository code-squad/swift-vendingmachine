//
//  AdminOutputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class AdminOutputView: OutputView {
    
    override func printBeverageMenu(entireInventory: [ObjectIdentifier : [Beverage]]) {
        print("현재 재고 상태 입니다.")
        for (index, menu) in entireInventory.enumerated() {
            let numberOfBeverage = menu.value.count
            print("\(index+1)] \(menu.value[0].kindOf)(\(numberOfBeverage)개) ")
        }
        print()
    }
    
    func printInventoryUseMenu() {
        print("1. 재고 추가(1 메뉴번호 갯수)\n2. 재고 삭제(2 메뉴번호 갯수)\n> ", terminator: "")
    }
    
    func printAddInventory(choiceBeverage: Beverage, number: Int) {
        print("\(choiceBeverage.kindOf)를 \(number)개 추가합니다.")
    }
    
    func printDeleteInventory(choiceBeverage: Beverage, number: Int) {
        print("\(choiceBeverage.kindOf)를 \(number)개 삭제합니다.")
    }
    
}
