//
//  Error.swift
//  VendingMachine
//
//  Created by 김지나 on 15/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Error: String {

    case inCorrect = "❌ 메뉴를 확인해주세요"
    case notEnoughBalance = "❌ 잔액이 부족합니다."
    case outOfStock = "❌ 재고가 부족합니다."
    case notError = ""
    
    func message() -> String {
        return self.rawValue
    }

}

// 올바른 메뉴 선택 확인
func inCorrect(_ input: String) -> Error {
    let value = input.first
    guard value == "1" || value == "2" else { return Error.inCorrect }
    return .notError
}

// 잔액 확인
func notEnoughBalance(of machine: VendingMachine, _ input: String) -> Error {
    let balance = machine.balance()
    let status = machine.currentBeverageStatus()
    let selectBeverage = Int(input.dropFirst(2))! - 1
    for drinks in status {
        if drinks.key == selectBeverage {
            guard balance >= status[drinks.key]!.1 else { return .notEnoughBalance }
        }
    }
    return .notError
}

// 재고 확인
// 메뉴 제대로 입력 안됬을 때
