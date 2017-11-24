//
//  InputView.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias InputFormat = (option: Int, detail: Int)

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
    
    func read() throws -> InputFormat {
        let input = readLine() ?? ""
        guard let resultForInput = makeValidFormat(separator: " ")(input) else {
            throw InputError.invalidFormat
        }
        return resultForInput
    }

    private func makeValidFormat(separator: Character) -> (String) -> InputFormat? {
        return { (input: String) -> InputFormat? in
            if input.convertToIntValue == 3 {
                return (3, -1)
            }
            let splitIntoOptionAndDetail = input.split(separator: separator)
            if splitIntoOptionAndDetail.count != 2 {
                return nil
            }
            let option = String(splitIntoOptionAndDetail.first!)
            let detail = String(splitIntoOptionAndDetail.last!)
            guard let optionInteger = option.convertToIntValue,
                let detailInteger = detail.convertToIntValue else {
                return nil
            }
            return (optionInteger, detailInteger)
        }
    }

}

extension InputView {
    enum InputError: String, Error {
        case invalidFormat = "입력 형식이 올바르지 않습니다."
    }
}
