//
//  InputView.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {

    func readMode() throws -> Int {
        print("자판기를 시작합니다.")
        print("1. 관리자 모드\n2. 사용자 모드")
        let input = readLine() ?? ""
        guard let convertInputToInt = input.convertToIntValue else {
            throw InputError.invalidFormat
        }
        return convertInputToInt
    }

    func read() throws -> Action {
        let input = readLine() ?? ""
        guard let resultForInput = makeValidFormat(separator: " ")(input) else {
            throw InputError.invalidFormat
        }
        return resultForInput
    }

    private func makeValidFormat(separator: Character) -> (String) -> Action? {
        return { (input: String) -> Action? in
            if input.convertToIntValue == 3 {
                return Action(option: 3, detail: -1)
            }
            let splitIntoOptionAndDetail = input.split(separator: separator)
            guard let option = splitIntoOptionAndDetail.first,
                let detail = splitIntoOptionAndDetail.last,
                let optionInteger = String(option).convertToIntValue,
                let detailInteger = String(detail).convertToIntValue else {
                return nil
            }
            return Action(option: optionInteger, detail: detailInteger)
        }
    }

}

extension InputView {
    enum InputError: String, Error {
        case invalidFormat = "입력이 유효하지 않습니다."
    }
}
