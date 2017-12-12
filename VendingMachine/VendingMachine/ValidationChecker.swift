//
//  ValidationChecker.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 12..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct ValidationChecker {

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

    func getSelector(input: String) throws -> (Int, Int) {
        guard input != "q" && input != "quit" else {
            throw ValidationChecker.Errors.quit
        }
        let inputs = input.split(separator: " ")
                          .flatMap { String($0) }
                          .filter { Int($0) != nil }
                          .map { Int($0)! }
        guard validate(inputs: inputs) else {
            throw Errors.invalidInput
        }
        if inputs.count == 1, inputs[0] == 3 {
            return (inputs[0], 0)
        } else {
            return (inputs[0], inputs[1])
        }
    }

}
