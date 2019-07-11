//
//  WorkFlow.swift
//  VendingMachine
//
//  Created by jang gukjin on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct WorkFlow {
    /// 입력받은 값에 따라 자판기의 기능을 실행하는 메소드
    static func selectMenu( vendingMachine: inout VendingMachine, of answers: [String]) -> String {
        let menuAnswer: Int = Int(answers[0]) ?? 0
        var additionalAnswer: Int = 0
        if answers.count > 1 {
            additionalAnswer = Int(answers[1]) ?? 0
        }
        let itemsSet = vendingMachine.getItems().set()
        var result: String = ""
        
        switch menuAnswer {
        case 1: vendingMachine.pay(of: additionalAnswer)
        case 2: result = vendingMachine.purchase(of: itemsSet[additionalAnswer-1])+"\n"
        default : result = "\(vendingMachine.isPurchaseDetails())\n"
        }
        return result
    }
}
