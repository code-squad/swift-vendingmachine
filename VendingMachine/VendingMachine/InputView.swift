//
//  InputView.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {

    func askSelectMode() -> Int {
        print("자판기를 시작합니다.\n1.관리자 모드\n2.사용자 모드\n> ")
        let input = Int(readLine() ?? "") ?? 0
        return input
    }

    func askSelectOption(message: CustomStringConvertible) -> [Int] {
        print(message)
        let input = readLine() ?? ""
        if input.contains(" ") {
            let splitInput = input.split(separator: " ")
            let options = splitInput.map({ Int($0) ?? 0 })
            return options
        } else if input == "q" {
            return [-1]
        } else {
            return [0]
        }
    }

    // InputView와 InputChecker를 분리하려고했지만 기능이 한 개씩 밖에 없어서 InputView에 Input값을 검사하는 메소드 추가함
    func checkValid(input: [Int]) -> [Int] {
        switch input[0] {
        case 1:
            if input[1] > 0 {
                return input
            }
        case 2:
            if (1 <= input[1]) && (input[1] <= 6) {
                return input
            }
        case -1: return [-1] // 컨트롤러에서의 종료조건
        default : return [0]
        }

        return [0]
    }

}

