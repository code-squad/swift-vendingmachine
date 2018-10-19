//
//  InputView.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum MenuType: Int {
    static func description(with stocks: Stocks, _ account: Int) -> String {
        var result = "현재 투입한 금액이 \(account)원입니다. 다음과 같은 음료가 있습니다."
        // 잔액이 0 이면 가격을 제외한 목록만, 0 이상이라면 가격과 함께 선택 가능한 리스트 형태로 출력
        let hasAccount = account != 0
        let beverageDiscription = stocks.getInfo(hasAccount: hasAccount) {
            return $0.getBundleTag { " \($0.summary(isSelectable: hasAccount)) (\($1)개)"}
        }
        result += beverageDiscription
        result += "\n1. 금액추가\n2. 음료구매\n> "
        return result
    }
    case deposit = 1
    case purchase
}

class InputView {
    
    static func read(with stocks: Stocks, account: Int) -> String? {
        print(MenuType.description(with: stocks, account), terminator: "")
        return readLine()
    }
}
