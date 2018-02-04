//
//  InputView.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum InputMessage: CustomStringConvertible {
    case insertBill
    case selectBeverage

    var description: String {
        switch self {
        case .insertBill:
            return "금액을 투입하세요. (1. 1,000원 | 2. 5,000원 | 3. 10,000원)"
        case .selectBeverage:
            return "음료와 수량을 선택하세요."
        }
    }
}

struct InputView {

    func insertBill(message: CustomStringConvertible) -> Int {
        print(message)
        if let input = Int(readLine() ?? "") {
            return input
        }
        return 0
    }

    func askPurchaseOption(message: CustomStringConvertible) -> [Int] {
        print(message)
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
