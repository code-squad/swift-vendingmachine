//
//  OutputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct AdminView {
    private let messageMaker: MessageMaker
    
    init() {
        self.messageMaker = MessageMaker()
    }
    
    func printAdminViewMessage(_ machine: MachineManagerable & InventoryCountable) {
        print(messageMaker.makeAdminViewMessage(machine))
    }
    
    func printSalesHistory(_ machine: MachineManagerable & InventoryCountable) {
        print(messageMaker.viewSalesHistory(machine))
    }
}
