//
//  main.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

let vendingMachine: VendingMachine = VendingMachine.init()

while true {
    OutputView.showMode()
    let mode = InputView.readInput()
    guard mode != "q" && mode != "quit" else {
        break
    }
    if mode == "1" {
        let admin = AdminController.init(vendingMachine: vendingMachine)
        admin.manage()
    } else {
        var user = UserController.init(vendingMachine: vendingMachine)
        user.use()
    }
}

