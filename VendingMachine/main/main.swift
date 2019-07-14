//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let vendingMachine = VendingMachine()
    
    let strawberryMilk = StrawberryMilk(stringDate: "20190630", strawberryContent: 20)
    let chocolateMilk = ChocolateMilk(fattyContent: 1.4)
    let coke = Coke(calorie: 200, sugarFree: false)
    let sprite = Sprite(calorie: 90, lemonContent: 3.5)
    let topCoffee = TOPCoffee(temperature: 70.0, arbicaBeansContent: true)
    let cantataCoffee = CantataCoffee(temperature: 30.0, DripStatus: true)
    
    var endPoint = 0
    
    vendingMachine.stockUp(of: strawberryMilk, count: 3)
    vendingMachine.stockUp(of: chocolateMilk, count: 3)
    vendingMachine.stockUp(of: coke, count: 3)
    vendingMachine.stockUp(of: sprite, count: 3)
    vendingMachine.stockUp(of: topCoffee, count: 3)
    vendingMachine.stockUp(of: cantataCoffee, count: 3)

    
    while endPoint == 0 {
        let mode = InputView.readInput()
        if mode == .Quit {
            endPoint = 1
        } else if mode == .Error {
            print(mode.rawValue)
        }
        while mode == .Admin || mode == .User {
            let adminInputView = AdminInputView()
            let userInputView = UserInputView()
            var input: [String] = []
            
            switch mode {
            case .Admin: input = adminInputView.input(items: vendingMachine.getItems(), menuMent: mode)
            case .User: input = userInputView.input(items: vendingMachine.getItems(), money: vendingMachine.checkBalance(), menuMent: mode)
            default: input = ["0"]
            }
            
            let manager = Manager(input: input[0])
            
            if manager == .back {
                break
            } else if manager == .quit {
                endPoint = 1
                break
            } else if manager == .proceed {
                var workFlow = WorkFlow(mode: mode)
                let result = workFlow.selectMenu(vendingMachine: vendingMachine, of: input)
                OutputView.printResult(of: result)
            } else {
                print("범위 안에 있는 숫자를 입력해주세요")
                continue
            }
        }
    }
}

main()
