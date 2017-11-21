//
//  InputView.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {
    typealias InputFormat = (option: Int, detail: Int)

    func readMode() throws -> VendingMachineMode {
        print("자판기를 시작합니다.")
        let selectModeMessage = String(format: "1. %@ \n2. %@",
                                       "관리자 모드",
                                       "사용자 모드")
        print(selectModeMessage)
        let input = readLine() ?? ""
        switch input {
        case VendingMachine.Mode.manager.rawValue:
            return  .manager
        case VendingMachine.Mode.user.rawValue:
            return .user
        default: break
        }
        throw InputError.invalidFormat
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
    enum Option: String {
        case addMoney = "1"
        case buyDrink = "2"
        case extractRemainMoney = "3"
    }
}
