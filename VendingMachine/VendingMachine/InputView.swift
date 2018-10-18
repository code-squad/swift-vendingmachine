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
            return $0.getBundleTag { "\($0.summary(isSelectable: hasAccount)) \($1)개"}
        }
        result += beverageDiscription
        result += "\n1. 금액추가\n2. 음료구매\n> "
        return result
    }
    case deposit = 1
    case purchase
    
    func isInRange(_ value: Int) -> Bool {
        if value < 0 { return false }
        
        switch self {
        case .deposit:
            return true
        case .purchase:
            return value <= 6
        }
    }
}

class InputView {
    
    static func read(with stocks: Stocks, account: Int) throws -> (menu: MenuType, value: Int) {
        print(MenuType.description(with: stocks, account), terminator: "")
        do {
            guard let rawValue = readLine() else { throw VendingMachineError.wrongInput }
            let result = try analysis(rawValue)
            return result
        } catch let err {
            throw err
        }
    }
    
    private static func analysis(_ rawValue: String) throws -> (menu: MenuType, value: Int){
        let parsed = rawValue.split(separator: " ").map { String($0) }
        guard let selected = Int(parsed[0]), let menu = MenuType(rawValue: selected) else { throw VendingMachineError.wrongInput }
        guard let additional = Int(parsed[1]) else { throw VendingMachineError.wrongInput }
        if !menu.isInRange(additional) { throw VendingMachineError.wrongInput }
        return (menu, additional)
    }
}
