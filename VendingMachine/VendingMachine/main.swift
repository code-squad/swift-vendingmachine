//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() throws {
    var machine = VendingMachineMock.supply()
    
    while true {
        do {
            guard let (mode, answer) = try InputView().chooseAction(machine: machine) else {
                break
            }
            
            machine = try Mode().act(input: (mode, answer), machine: machine) as! VendingMachine
            
            if mode == InputView.Mode.buyBeverage {
                printResult(index: answer)
            }
        } catch let e as BeverageErrors {
            print(e.localizedDescription)
        }
    }
}

private func printResult(index: Int) {
    let beverageMenu = allMenus[index-1]
    let beverage = beverageMenu.makeInstance()
    OutputView().printResult(beverage: beverage)
}

try main()

