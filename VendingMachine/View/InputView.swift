//
//  InputView.swift
//  VendingMachine
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    var vendingMachine = VendingMachine()
    
    /// 안내문구를 출력하고 값을 입력받는 메소드
    func readInput(money: Int) -> [String] {
        var purifiedAnswer: [String] = []
        while true {
            print("현재 투입한 금액이 \(money)원 입니다. 다음과 같은 음료가 있습니다.(0을 입력하면 종료)")
            let items = vendingMachine.getItems()
            let itemsSet = vendingMachine.set(of: items)
            for index in 0..<itemsSet.count {
                print("\(index+1)) "+itemsSet[index].getName()+" \(itemsSet[index].getPrice()) (\(items.countElement(of: itemsSet[index]))개)")
            }
            print("""
                1. 금액 추가
                2. 음료 구매
                3. 구매 내역
                >>
                """, terminator: "")
            let answer = readLine()
            purifiedAnswer = classifyAnswer(of: answer)
            if ((distinctAnswer(of: purifiedAnswer[0], menuNumber: 2) == true) && (purifiedAnswer.count == 2)) || ((purifiedAnswer[0] == "3" || purifiedAnswer[0] == "0") && (purifiedAnswer.count == 1)) {
                break
            } else {
                print("범위 내의 숫자를 입력핻주세요")
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
        let correctAnswer: Int = Int(answer) ?? -1
        return correctAnswer >= 0 && correctAnswer <= menuNumber
    }
}
