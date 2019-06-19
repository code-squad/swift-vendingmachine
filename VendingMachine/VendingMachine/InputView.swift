//
//  InputView.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    private func printMenuInputGuidance (vendingMachine: VendingMachine) {
        print("현재 투입한 금액이 \(vendingMachine.getBalance())원입니다. 다음과 같은 음료가 있습니다.")
        print()
        print("자판기 메뉴를 선택하세요.")
        print("1. 금액 넣기") // 자판기 금액을 원하는 금액만큼 올리는 메소드
        
        print("0. 종료")
    }
    
    현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.
    => 딸기우유(3개) 바나나우유(2개) 팹시콜라(5개) TOP커피(3개) 핫식스(4개)
    1. 금액추가
    2. 음료구매
    
    func readInput () -> String {
        let menu: String
        
        printMenuInputGuidance()
        print("> ", terminator: "")
        menu = readLine() ?? "0"
        
        return menu
    }
}
