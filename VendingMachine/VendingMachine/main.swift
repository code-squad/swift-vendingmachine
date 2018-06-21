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
    
    while true {
        outputView.printAllStock()
        OutputView.printBeverageMenu()
        OutputView.startAdminModeMessage()
        let (menu, option) = InputView.selectMenu()
        switch menu {
        case ADDBEVERAGE:
            // 추가하려는 메뉴가 있는지 확인하고 있으면 생성해서 자판기에 추가
            guard let beverage = Administrator.makeBeverage(option) else {
                throw StockManager.Error.selectMenuError
            }
            vendingMachine.add(beverage: beverage)
        default:
            break
        }
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
