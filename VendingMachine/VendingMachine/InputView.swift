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
        print("1. 금액추가 \n2. 음료구매 \n>> ")
        let input = readLine() ?? ""
        if input.contains(" ") {
            let splitInput = input.split(separator: " ")
            let options = splitInput.map({ Int($0) ?? 0 })
            return options
        } else {
            return [0]
        }
    }

    // InputView와 InputChecker를 분리하려고했지만 기능이 한 개씩 밖에 없어서 InputView에 Input값을 검사하는 메소드 추가함
    func checkValid(input: [Int]) -> [Int] {
        switch input[0] {
        case 1:
            if input[1] > 0 {
                return input
            }
        case 2:
            if (1 <= input[1]) && (input[1] <= 6) {
                return input
            }
        default : return [0]
        }

        return [0]
    }

}

