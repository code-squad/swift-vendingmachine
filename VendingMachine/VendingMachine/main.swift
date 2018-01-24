//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


func main() throws {
    let vendingMachine = VendingMachine()
    var isEnd = true
    
    do {
        while isEnd {
            guard let enabledMode = InputView().chooseMode() else {
                throw VendingMachineErrors.invalidValue
            }
            
            switch enabledMode {
            case .admin :
                let admin = Admin(vendingMachine as MachineManagerable & InventoryCountable)
                try admin.execute()
            case .user :
                let user = User(vendingMachine as Userable & InventoryCountable)
                try user.execute()
            case .exit:
                isEnd = false
            }
        }
    } catch let e as VendingMachineErrors {
        print(e.localizedDescription)
    }
}

try main()

