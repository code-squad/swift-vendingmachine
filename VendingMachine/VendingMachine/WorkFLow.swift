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
        let itemsSet = vendingMachine.getItems().set()
        var result = ""
        
        switch mode {
        case .Admin: result = adminWorkFlow(vendingMachine: vendingMachine, of: answers, itemsSet: itemsSet)
        case .User: result = userWorkFlow(vendingMachine: vendingMachine, of: answers, itemsSet: itemsSet)
        default: result = ""
        }
        return result
    }
    
    /// 관리자 모드일때 입력받은 값에 따라 자판기의 기능을 실행하는 메소드
    func adminWorkFlow(vendingMachine: VendingMachine, of answers: [String], itemsSet: [Product]) -> String {
        let answer = convertEachAnswers(of: answers)
        var result = ""
        
        switch answer.first {
        case 1: print("추가할 재고의 갯수입력:",terminator:"")
            let count = Int(readLine() ?? "") ?? 0
            vendingMachine.stockUp(of: itemsSet[answer.second-1], count: count)
        case 2: print("제거할 재고의 갯수입력:",terminator:"")
        let count = Int(readLine() ?? "") ?? 0
            vendingMachine.takeOutStock(of: itemsSet[answer.second-1], count: count)
        default : result = "\(vendingMachine.isItemsPastExpirationDate())\n"
        }
        return result
    }
    
    /// 사용자 모드일때 입력받은 값에 따라 자판기의 기능을 실행하는 메소드
    func userWorkFlow(vendingMachine: VendingMachine, of answers: [String], itemsSet: [Product]) -> String {
        let answer = convertEachAnswers(of: answers)
        var result: String = ""
    
        switch answer.first {
        case 1: vendingMachine.pay(of: answer.second)
        case 2: result = vendingMachine.purchase(of: itemsSet[answer.second-1])+"\n"
        default : result = "\(vendingMachine.isPurchaseDetails())\n"
        }
        return result
    }
    
    /// [String]을 [Int]로 변환하는 함수
    func convertEachAnswers(of answers: [String]) -> (first: Int, second: Int) {
        let menuAnswer: Int = Int(answers[0]) ?? 0
        var additionalAnswer: Int = 0
        if answers.count > 1 {
            additionalAnswer = Int(answers[1]) ?? 0
        }
        return (first: menuAnswer, second: additionalAnswer)
    }
}
