//
//  Input.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 24..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Input {
    let mode: Int
    let value: Int
    
    init(input: String) {
        let splitedInput = input.split(separator: " ").map(){Int($0) ?? 0}
        self.mode = splitedInput[0]
        self.value = splitedInput[1]
    }
}
