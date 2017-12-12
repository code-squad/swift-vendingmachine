//
//  InputView.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct InputView {

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

    func readInput() throws -> (Int, Int) {
        let input = readLine() ?? ""
        guard input != "q" && input != "quit" else {
            throw Errors.quit
        }
        let inputs = input.split(separator: " ")
                        .flatMap { String($0) }
                        .filter { Int($0) != nil }
                        .map { Int($0)! }
        if inputs.count == 1, inputs[0] == 3 {
            return (3, 0)
        }
        guard inputs.count == 2 else {
            throw Errors.invalidInput
        }
        return (inputs[0], inputs[1])
    }

}
