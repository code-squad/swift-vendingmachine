//
//  WorkFlow.swift
//  VendingMachine
//
//  Created by jang gukjin on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct WorkFlow {
    private var mode: MenuMent
    
    init(mode: MenuMent){
        self.mode = mode
    }
    
    /// 입력받은 값에 따라 자판기의 기능을 실행하는 메소드
    mutating func selectMenu( vendingMachine: VendingMachine, of answers: [String]) -> String {
        var result = ""
        switch mode {
        case .Admin: adminWorkFlow(vendingMachine: vendingMachine, of: answers)
        default: result = userWorkFlow(vendingMachine: vendingMachine, of: answers)
        }
        return result
    }
    
    /// 관리자 모드일때 입력받은 값에 따라 자판기의 기능을 실행하는 메소드
    func adminWorkFlow(vendingMachine: VendingMachine, of answers: [String]) -> String {
        let menuAnswer: Int = Int(answers[0]) ?? 0
        var additionalAnswer: Int = 0
        if answers.count > 1 {
            additionalAnswer = Int(answers[1]) ?? 0
        }
        let itemsSet = vendingMachine.getItems().set()
        var result = ""
        
        switch menuAnswer {
        case 1: vendingMachine.stockUp(of: itemsSet[additionalAnswer-1], count: 1)
        case 2: vendingMachine.takeOutStock(of: itemsSet[additionalAnswer-1], count: 1)
        default : result = "\(vendingMachine.isItemsPastExpirationDate())\n"
        }
        return result
    }
    
    /// 사용자 모드일때 입력받은 값에 따라 자판기의 기능을 실행하는 메소드
    func userWorkFlow(vendingMachine: VendingMachine, of answers: [String]) -> String {
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
