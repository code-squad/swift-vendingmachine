//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var vendingMachine = VendingMachine()
vendingMachine.inventory()

func main() {
    OutputView.currentStatus(vendingMachine.balance()) // 현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.
    OutputView().beverageList(vendingMachine)
    OutputView.menu() // 1. 금액추가 2. 음료구매
    let input = InputView().selectMenu() // 메뉴를 선택하도록 입력 받는다.
    
    OutputView().printError(inCorrect(input))

    switch input.first {
        case "1": vendingMachine.insert(money: input)
        case "2":
            guard notEnoughBalance(of: vendingMachine, input) == .notError else { return OutputView().printError(notEnoughBalance(of: vendingMachine, input)) }
            vendingMachine.sell(beverage: input)
        default: break
    }
    
}
while true {
    main()

}
