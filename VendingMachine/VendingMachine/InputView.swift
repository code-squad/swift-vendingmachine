//
//  InputView.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {
    typealias InputFormat = (option: Option, detail: Int)

    func start() throws -> VendingMachineMode {
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
        let inputMessage = String(format: "1. %@ \n2. %@\n3. %@",
                                  "금액추가",
                                  "음료구매",
                                  "잔돈출금")
        print(inputMessage)
        let input = readLine() ?? ""
        guard let resultForInput = makeValidFormat(separator: " ")(input) else {
            throw InputError.invalidFormat
        }
        return resultForInput
    }

    private func makeValidFormat(separator: Character) -> (String) -> InputFormat? {
        return { (input: String) -> InputFormat? in
            if input == Option.extractRemainMoney.rawValue {
                return (.extractRemainMoney, -1)
            }
            let splitIntoOptionAndDetail = input.split(separator: separator)
            if splitIntoOptionAndDetail.count != 2 {
                return nil
            }
            let option = String(splitIntoOptionAndDetail.first!)
            let detail = String(splitIntoOptionAndDetail.last!)
            guard let resultForInput = self.convertStringToInputFormat(option: option, detail: detail) else {
                return nil
            }
            return resultForInput
        }
    }

    private func convertStringToInputFormat(option: String, detail: String) -> InputFormat? {
        switch option {
        case Option.addMoney.rawValue:
            guard let money = Int(detail) else {
                return nil
            }
            return (.addMoney, money)
        case Option.buyDrink.rawValue:
            guard let drinkNumber = Int(detail) else {
                return nil
            }
            return (.buyDrink, drinkNumber)
        default:
            return nil
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
