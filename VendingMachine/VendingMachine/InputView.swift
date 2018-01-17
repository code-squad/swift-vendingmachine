//
//  InputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
//    현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.
//    => 딸기우유(3개) 바나나우유(2개) 팹시콜라(5개) TOP커피(3개) 핫식스(4개)
//    1. 금액추가
//    2. 음료구매
//    > 1 10000

    func printInitialMenu(vendingMachine: VendingMachine) -> [String] {
        print("현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.")
        let entireInventory = vendingMachine.showEntireInventory()
        for menu in entireInventory {
            let numberOfBeverage = menu.value.count
            print("\(menu.value[0].kindOf)(\(numberOfBeverage)개) ", terminator: "")
        }
        print("\n1. 금액추가")
        print("2. 음료구매")
        print("> ")
        if let inputFromUser = readLine() {
            return separateInputValues(input: inputFromUser)
        }
        return []
    }
    
    func separateInputValues(input: String) -> [String] {
        return input.split(separator: " ").map({String($0)})
    }
    

//    현재 투입한 금액이 10,000원입니다. 다음과 같은 음료가 있습니다.
//    1)딸기우유 1000원(3개)
//    2)바나나우유 1000원(2개)
//    3)팹시콜라 2000원(5개)
//    4)TOP커피 3000원(3개)
//    5)핫식스 1500원(4개)
//    1. 금액추가
//    2. 음료구매
//    > 2 1
//    딸기우유를 구매하셨습니다. 1000원을 차감합니다.
//    
//    현재 투입한 금액이 9,000원입니다. 다음과 같은 음료가 있습니다.
//    1)딸기우유 1000원(3개)
//    2)바나나우유 1000원(2개)
//    3)팹시콜라 2000원(5개)
//    4)TOP커피 3000원(3개)
//    5)핫식스 1500원(4개)
//    1. 금액추가
//    2. 음료구매
//    > 2 4
//    TOP커피를 구매하셨습니다. 3000원을 차감합니다.

}
