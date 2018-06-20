//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

enum Mode: CaseIterable {
    case administrator
    case user
    case quit
}

let ADDBEVERAGE = 1
let REMOVEBEVERAGE = 2
let REMOVEEXPIRATION = 3

func main() {
    
    let vendingMachine = VendingMachine(stockManager: StockManager(stock: [:]), history: History(purchased: []))
    setupDefaultBeveages(vendingMachine)
    
    while true {
        do{
            OutputView.startMessage()
            let mode = try InputView.selectMode()
            switch mode {
            case .administrator:
                try runAdminMode(vendingMachine)
            case .user:
                runUserMode()
            case .quit:
                return
            }
        } catch let error as InputView.Error {
            print(error.errorMessage)
            continue
        } catch {
            fatalError("unexpected error")
        }
    }
}

func runAdminMode(_ vendingMachine: VendingMachineManagable & VendingMachinePrintable) throws {
    let outputView = OutputView(vendingMachine)
    OutputView.startAdminModeMessage()
    let (menu, option) = InputView.selectMenu()
    switch menu {
    case ADDBEVERAGE:
        // 음료 추가
        // 전체 재고 보여주기
    default:
        break
    }
    
}

func runUserMode() {
    
}

func setupDefaultBeveages(_ vendingMachine: VendingMachine) {
    vendingMachine.add(beverage: TOP())
    vendingMachine.add(beverage: Cantata())
    vendingMachine.add(beverage: Georgia())
    vendingMachine.add(beverage: StrawberryMilk())
    vendingMachine.add(beverage: ChocoMilk())
    vendingMachine.add(beverage: Coke())
    vendingMachine.add(beverage: Sprite())
}
main()
