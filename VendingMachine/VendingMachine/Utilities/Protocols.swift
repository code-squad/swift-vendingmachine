//
//  Protocols.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias Stock = Int
typealias Balance = Int
typealias Purchased = Int
typealias Argument = Int

protocol Machine {
    associatedtype MenuType: EnumCollection, Purchasable
    func checkTheStock() -> [MenuType:Stock]
}

protocol Managable: Machine {
    func fullSupply(_ count: Int)

    func supply(beverageType: MenuType, _ addCount: Stock)

    func remove(beverageType: MenuType, _ addCount: Stock)

    func showPurchasedList() -> [HistoryInfo]
}

protocol UserServable: Machine {
    func popBeverage(_ menu: MenuType) -> Beverage?

    func insertMoney(_ money: MoneyManager.Unit)

    func showBalance() -> Balance

    func showAffordableBeverages() -> [MenuType]

    func showExpiredBeverages(on day: Date) -> [MenuType:Stock]

    func showHotBeverages() -> [MenuType]
}

protocol ActivateMode {
    func prompt() -> [Argument]?
    
    func perform(_ arguments: [Argument]) -> String?
}

extension ActivateMode {
    // 사용자 입력 문자열을 2개의 인자로 분리 및 숫자 변환.
    func splitUserInput() -> [Int] {
        guard let userInput = readLine(), userInput != "q" || userInput != "quit" else { return [] }
        return userInput.split(separator: " ").flatMap { Int($0) }
    }

}

protocol Purchasable {
    var price: Int { get }

    var productName: String { get }
}
