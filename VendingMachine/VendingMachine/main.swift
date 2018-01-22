//
//  main.swift
//  VendingMachine
//
//  Created by Jack (2018/01/15)
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let form = DateFormatter()
form.dateFormat = "yyyyMMdd"

let baseProductsBox = [StrawberryMilk(),StrawberryMilk(),StrawberryMilk(),BananaMilk(),BananaMilk(),BananaMilk(),PepciCoke(),PepciCoke(),PepciCoke(),PepciCoke(),PepciCoke(),Fanta(),Fanta(),Fanta(),TOPCoffee(),TOPCoffee(),TOPCoffee(),Georgia(),Georgia()]

var vendingMachine = VendingMachine(productsBox: baseProductsBox)
var runVendingMachine : Bool = true
let inputView : InputView = InputView()
let outputView : OutputView = OutputView()
while runVendingMachine {
    
    outputView.printModeSelectMessage(.menu)
    let userMode = inputView.readMode()
    guard userMode != .exit else { break }
    if userMode == .invalidMode {
        outputView.printModeSelectMessage(.invalidMenu)
        continue
    }
    switch userMode {
    case .admin :
        let admin = VendingMachineAdmin(vendingMachine)
        var adminController = AdminController(admin)
        adminController.executeAdmin()
    case .user :
        let user = VendingMachineUser(vendingMachine)
        var userController = UserContorller(user)
        userController.executeUser()
    default :
        break
    }
}
