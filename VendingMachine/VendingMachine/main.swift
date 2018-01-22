//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() throws {
    let machine = VendingMachine()
    machine.supply(3)
    
    do {
        while true {
            let inputViewMessage = ScreenHelper().makeInputViewMessage(machine: machine)
            guard let (mode, answer) = try InputView.chooseAction(inputViewMessage) else {
                break
            }
            
            switch mode {
            case .insertMoney: try machine.insertMoney(coin: Money(answer))
            case .buyBeverage: try machine.buyBeverage(beverageMenu: allMenus[answer-1])
            }
            
            OutputView().printResult(mode: mode, answer: answer)
        }
    } catch let e as VendingMachineErrors {
        print(e.localizedDescription)
    }
    
}

try main()

