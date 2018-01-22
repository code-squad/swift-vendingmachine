//
//  OutputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {
    var availableBeverage: [ObjectIdentifier : [Beverage]]
    init() {
        availableBeverage = [ObjectIdentifier : [Beverage]]()
    }
    
    func printBeverageMenu(entireInventory: [ObjectIdentifier : [Beverage]]) {
        for menu in entireInventory {
            let numberOfBeverage = menu.value.count
            print("\(menu.value[0].kindOf)(\(numberOfBeverage)개) ", terminator: "")
        }
        print()
    }
    
}
