//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func activateMachine(_ enabledMode: ModeType, _ vendingMachine: VendingMachine) throws -> Bool {
    switch enabledMode {
    case .admin :
        let admin = Admin(vendingMachine as MachineManagerable & InventoryCountable)
        return try admin.execute()
    case .user :
        let user = User(vendingMachine as Userable & InventoryCountable)
        return try user.execute()
    case .exit:
        return true
    }
}

func activateMode() throws -> ModeType {
    guard let enabledMode = InputView().chooseMode() else {
        throw VendingMachineErrors.invalidValue
    }
    
    return enabledMode
}

func main() throws {
    let vendingMachine = VendingMachine()
    var enabledMode = ModeType.exit
    var isEnd = true
    var isActivated = false
    
    do {
        while isEnd {
            if !isActivated { enabledMode = try activateMode() }
            
            if enabledMode == .exit {
                isEnd = false
                break
            }
            
            isActivated = try activateMachine(enabledMode, vendingMachine)
        }
    } catch let e as VendingMachineErrors {
        print(e.localizedDescription)
    }
}

try main()
