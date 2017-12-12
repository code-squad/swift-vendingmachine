//
//  ValidationChecker.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 12..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct ValidationChecker {

    enum VendingMenu: Int {
        case none
        case insertCoins = 1, buyProduct, salesHistory
    }

    enum Errors: CustomStringConvertible, Error {
        case invalidInput
        case quit
        case notInMenu

        var description: String {
            switch self {
            case .invalidInput:
                return "입력을 확인해주세요."
            case .quit:
                return "자판기 사용을 종료합니다."
            case .notInMenu:
                return "보기에서 고르세요."
            }
        }
    }

    private func validate(inputs: [Int]) -> Bool {
        return (inputs.count == 1 && inputs[0] == 3) || (inputs.count == 2)
    }

    func getSelector(input: String) throws -> (VendingMenu, Int) {
        guard input != "q" && input != "quit" else {
            throw Errors.quit
        }
        let inputs = input.split(separator: " ")
                          .flatMap { String($0) }
                          .filter { Int($0) != nil }
                          .map { Int($0)! }
        guard validate(inputs: inputs) else {
            throw Errors.invalidInput
        }
        guard let vendingMenu = VendingMenu.init(rawValue: inputs[0]) else {
            throw Errors.notInMenu
        }
        if inputs.count == 1, inputs[0] == 3 {
            return (vendingMenu, 0)
        } else {
            return (vendingMenu, inputs[1])
        }
    }

}
