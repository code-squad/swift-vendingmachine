//
//  Input.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 24..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachineInput {
    private let mode: Int
    private let value: Int
    
    init(input: String) {
        let splitedInput = input.split(separator: " ").map(){Int($0) ?? 0}
        self.mode = splitedInput[0]
        self.value = splitedInput[1]
    }
    
    func isModeEqual(_ int: Int) -> Bool {
        return int == self.mode
    }
    
    func readMoney() -> Int {
        return self.value
    }
    
    func readKey(keys: [String]) -> String {
        return keys[self.value - 1]
    }
}
