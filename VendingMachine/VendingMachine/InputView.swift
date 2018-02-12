//
//  InputView.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {

    func askSelectOption(message: CustomStringConvertible) -> [Int] {
        print(message)
        print("1. 금액추가 \n 2. 음료구매 \n")
        let input = readLine() ?? ""
        if input.contains(" ") {
            let splitInput = input.split(separator: " ")
            let options = splitInput.map({ Int($0) ?? 0 })
            return options
        } else {
            return [0]
        }
    }

}
