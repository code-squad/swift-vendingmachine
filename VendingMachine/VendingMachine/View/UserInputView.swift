//
//  UserInputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class UserInputView {
    func getMenuInput() -> VendingMachineUser {
        if let inputFromUser = readLine() {
            return separateInputValues(input: inputFromUser)
        }
        return VendingMachineUser()
    }
    
    func separateInputValues(input: String) -> VendingMachineUser {
        let seperatedValue = input.split(separator: " ").map({Int($0) ?? 0})
        if seperatedValue[0] == 1 {
            return CoinBox(amount: seperatedValue[1])
        } else if seperatedValue[0] == 2 {
            return BeveragePurchase(beverageMenu: seperatedValue[1])
        }
        return VendingMachineUser()
    }
}
