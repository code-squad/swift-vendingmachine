//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func selectMode(vendingMachine: VendingMachine) -> SelectMode? {
    while true {
        do {
            OutputView.selectMode()
            let inputData = InputView.readInput()
            if Menu.moveHighStep(input: inputData) {
                return nil
            }
            let userPick = try Menu.readUserMode(input: inputData)
            switch userPick {
            case .manager:
                return ManagerMode(vendingMachine: vendingMachine)
            case .customer:
                return CustomerMode(vendingMachine: vendingMachine)
            }
        } catch let error as MenuError {
            OutputView.showMessage(error: error)
        } catch {
            OutputView.showMessage(error: MenuError.notDefine)
        }
    }
}

func main() {
    let beverages = [Sprite(), Sprite(), Sprite(), CocaCola(), CocaCola(), CocaCola(),
                     CocaCola(), ChocolateMilk(), ChocolateMilk(),
                     BananaMilk(), BananaMilk(),
                     CantataCoffee(), CantataCoffee(), CantataCoffee(),
                     StarbucksCoffee(), StarbucksCoffee()]

    let vendingMachine = VendingMachine(startMoney: 0, list: Inventory(list: [:]))

    beverages.forEach { beverage in vendingMachine.add(beverage: beverage) }

    while true {
        guard var userPick = selectMode(vendingMachine: vendingMachine) else { return }
        userPick.perform()
    }
}

main()
