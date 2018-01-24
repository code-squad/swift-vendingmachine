//
//  AdminInputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class AdminInputView {
    func getMenuInput() -> InventoryAdmin {
        if let inputFromUser = readLine() {
            return separateInputValues(input: inputFromUser)
        }
        return InventoryAdmin()
    }
    
    func separateInputValues(input: String) -> InventoryAdmin {
        var inventoryAdmin = InventoryAdmin()
        let seperatedValue = input.split(separator: " ").map({Int($0) ?? 0})
        inventoryAdmin = InventoryAdmin(modeOfAdmin: seperatedValue[0], menuNumber: seperatedValue[1], numberOfTheBeverage: seperatedValue[2])
        return inventoryAdmin
    }
}
