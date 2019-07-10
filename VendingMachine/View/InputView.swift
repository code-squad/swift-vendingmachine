//
//  InputView.swift
//  VendingMachine
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    func readInput(money: Int) -> [String] {
        let vendingMachine = VendingMachine()
        var purifiedAnswer: [String] = []
        while true {
            print("현재 투입한 금액이 \(money)원 입니다. 다음과 같은 음료가 있습니다.")
            var index = 1
            for (key, value) in vendingMachine.isFullStock() {
                print("\(index)) "+key.getName()+" \(key.getPrice()) (\(value)개)")
                index += 1
            }
            print("""
            1. 금액 추가
            2. 음료 구매
            3. 뜨거운 음료 구매
            4. 관리자 모드
            5. 구매 내역
            """)
            let answer = readLine()
            purifiedAnswer = classifyAnswer(of: answer)
            if distinctAnswer(of: purifiedAnswer[0], menuNumber: 5) == true {
                break
            }
        }
        return purifiedAnswer
    }
    
    /// 관리자 모드의 선택화면
    func adminMode() -> [String] {
        var purifiedAnswer: [String] = []
        while true {
            print("관리자 모드입니다. 아래 항목을 선택해주세요")
            print("""
                1. 재고 추가
                2. 유통기한 지난 재고 확인
                3. 이전 화면
                """)
            let answer = readLine()
            purifiedAnswer = classifyAnswer(of: answer)
            if distinctAnswer(of: purifiedAnswer[0], menuNumber: 3) == true {
                break
            }
        }
        return purifiedAnswer
    }
    
    /// 공백을 기준으로 답을 구분하는 메소드
    func classifyAnswer(of input: String?) -> [String]{
        let answer: String = input ?? ""
        let answers = answer.components(separatedBy: " ")
        return answers
    }
    
    /// 첫번째 답이 옳은 답인지 판단하는 메소드
    func distinctAnswer(of answer: String, menuNumber: Int) -> Bool {
        let correctAnswer: Int = Int(answer) ?? 0
        print("범위 내의 숫자를 입력핻주세요")
        return correctAnswer > 0 && correctAnswer <= menuNumber
    }
}
