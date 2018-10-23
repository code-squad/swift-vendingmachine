//
//  OutputView.swift
//  VendingMachine
//
//  Created by 이동건 on 19/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum Comment: CustomStringConvertible {
    var description: String {
        switch self {
        case .buy(let beverage, let price):
            return "\(beverage.summary(isSelectable: false))를 구매하셨습니다. \(price)원을 차감합니다."
        case .introdution(let account):
            return "현재 투입한 금액이 \(account)원입니다. 다음과 같은 음료가 있습니다."
        case .list(let beverages, let isSelectable):
            var result = isSelectable ? "" : "\n=> "
            beverages.enumerated().forEach {
                let offSet = $0.offset
                let element = $0.element
                let prefix = isSelectable ? "\n\(offSet + 1)) " : " "
                result += prefix
                result += "\(element.beverage.summary(isSelectable: isSelectable)) (\(element.count)개)"
            }
            return result
        case .history(let list):
            return list.isEmpty ? "히스토리가 없습니다." : "\(list)"
        }
    }
    case buy(beverage: Beverage, price: Int)
    case introdution(account: Int)
    case list([(beverage: Beverage, count: Int)], isSelectable: Bool)
    case history(history: History)
}

class OutputView {
    static func display(with comment: Comment) {
        print(comment)
    }
    
    static func display(with error: VendingMachineError) {
        print(error)
    }
}
