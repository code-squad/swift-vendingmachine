//
//  AdminInputView.swift
//  VendingMachine
//
//  Created by jang gukjin on 12/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct AdminInputView {
    
    /// 안내문구를 출력하고 값을 입력받는 메소드
    func readInput(items: [Product], count: Int) -> [String] {
        var purifiedAnswer: [String] = []
        while true {
            print("관리자 모드 입니다.(0을 입력하면 종료)")
            let itemsSet = items.set()
            for index in 0..<itemsSet.count {
                print("\(index+1)) "+itemsSet[index].getName()+" \(itemsSet[index].getPrice()) (\(items.countElement(of: itemsSet[index]))개)")
            }
            print("""
                1. 재고 추가
                2. 재고 제거
                3. 유통기한 확인
                >>
                """, terminator: "")
            let answer = readLine()
            purifiedAnswer = classifyAnswer(of: answer)
            if ((distinctAnswer(of: purifiedAnswer[0], menuNumber: 2) == true) && (purifiedAnswer.count == 2)) || ((purifiedAnswer[0] == "3" || purifiedAnswer[0] == "0") && (purifiedAnswer.count == 1)) {
                break
            } else {
                print("범위 내의 숫자를 입력해주세요")
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
