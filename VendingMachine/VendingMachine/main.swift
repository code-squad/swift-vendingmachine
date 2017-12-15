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
    let input = InputView.readInput()
    guard input != "q" && input != "quit" else {
        break
    }
    switch vendingMachine.getMode(input: input) {
    case .admin:
        let admin = AdminController.init(vendingMachine: vendingMachine)
        admin.manage()
    case .user:
        var user = UserController.init(vendingMachine: vendingMachine)
        user.use()
    case .none:
        print(ValidationChecker.Errors.notInMenu)
    }
}
