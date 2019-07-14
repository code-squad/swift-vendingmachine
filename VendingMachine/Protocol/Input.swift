//
//  Input.swift
//  VendingMachine
//
//  Created by jang gukjin on 12/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Input {
    func readInput(items: [Product], menuMent: MenuMent) -> [String]
    func classifyAnswer(of input: String?) -> [String]
}

extension Input {
    /// 안내문구를 출력하고 값을 입력받는 메소드
    func readInput(items: [Product], menuMent: MenuMent) -> [String] {
        var purifiedAnswer: [String] = []
        let itemsSet = items.set()
        for index in 0..<itemsSet.count {
            print("\(index+1)) "+itemsSet[index].getName()+" \(itemsSet[index].getPrice()) (\(items.countElement(of: itemsSet[index]))개)")
        }
        print(menuMent.rawValue, terminator: "")
        let answer = readLine()
        purifiedAnswer = classifyAnswer(of: answer)
        return purifiedAnswer
    }
    
    /// 공백을 기준으로 답을 구분하는 메소드
    func classifyAnswer(of input: String?) -> [String]{
        let answer: String = input ?? ""
        let answers = answer.components(separatedBy: " ")
        return answers
    }
}
