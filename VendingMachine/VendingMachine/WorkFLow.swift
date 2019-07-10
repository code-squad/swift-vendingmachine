//
//  WorkFlow.swift
//  VendingMachine
//
//  Created by jang gukjin on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct WorkFlow {
    var vendingMachine = VendingMachine()
    
    /// 입력받은 값에 따라 자판기의 기능을 실행하는 메소드
    mutating func selectMenu(of answers: [String]) -> (vendingMachine: VendingMachine, output: String) {
        let menuAnswer: Int = Int(answers[0]) ?? 0
        var additionalAnswer: Int = 0
        if answers.count > 1 {
            additionalAnswer = Int(answers[1]) ?? 0
        }
        let itemsSet = vendingMachine.set(of: vendingMachine.getItems())
        var result: String = ""
        
        switch menuAnswer {
        case 1: vendingMachine.pay(of: additionalAnswer)
        case 2: result = vendingMachine.purchase(of: itemsSet[additionalAnswer-1])+"\n"
        default : result = "\(vendingMachine.isPurchaseDetails())\n"
        }
        return (vendingMachine: vendingMachine, output: result)
    }
}
