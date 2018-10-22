//
//  OutputView.swift
//  VendingMachine
//
//  Created by 이동건 on 19/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum Comment {
    case buy(beverage: Beverage)
    case introdution(account: Int)
    case list([(beverage: Beverage, count: Int)], isSelectable: Bool)
    case history(history: History)
}

class OutputView {
    static func display(with comment: Comment) {
        switch comment {
        case .buy(let beverage, let price):
            print("\(beverage.summary(isSelectable: false))를 구매하셨습니다. \(price)원을 차감합니다.")
        case .introdution(let account):
            print("현재 투입한 금액이 \(account)원입니다. 다음과 같은 음료가 있습니다.", terminator: "")
        case .list(let beverages, let isSelectable):
            var result = isSelectable ? "" : "\n=> "
            beverages.enumerated().forEach {
                let offSet = $0.offset
                let element = $0.element
                let prefix = isSelectable ? "\n\(offSet + 1)) " : " "
                result += prefix
                result += "\(element.beverage.summary(isSelectable: isSelectable)) (\(element.count)개)"
            }
            return print(result, terminator: "")
        case .history(let list):
            if list.isEmpty {
                print("히스토리가 없습니다.")
            }
            list.handle { (name, date) in
                print("상품 : \(name) / 구매날짜: \(date.readable)")
            }
        }
    }
    
    static func display(with error: VendingMachineError) {
        print(error)
    }
}
