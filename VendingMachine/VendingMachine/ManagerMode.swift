//
//  ManagerMode.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/11/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ManagerMode {
    let vendingMachine: VendingMachine
    
    func run() {
        while true {
            let managerMode = vendingMachine as VendingMachineManagerable & Printable
            
            managerMode.showInventory(form: OutputView.showInventory)
            
            let menuInput = InputView.readManagerMenu()
            guard let menu = ManagerMenu.init(rawValue: menuInput) else {
                OutputView.show(failMessage: .invalidInputMessage)
                
                continue
            }
            
            let input = InputView.readInput()
            let beverage = managerMode.fetchProduct(at: input)
            
            switch menu {
            case .addStock:
                managerMode.addStock(beverage)
            case .removeStock:
                managerMode.removeStock(beverage)
            }
        }
    }
}
