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

let EXITTOSELECTMODE = 0
let ADDBEVERAGE = 1
let REMOVEBEVERAGE = 2
let REMOVEEXPIRATION = 3
let INSERTCOIN = 1
let BUYBEVERAGE = 2

func main() {
    
    let vendingMachine = VendingMachine.shared()
    setupDefaultBeveages(vendingMachine)
    
    while true {
        do{
            OutputView.startMessage()
            let mode = try InputView.selectMode()
            switch mode {
            case .administrator:
                try runAdminMode(vendingMachine)
            case .user:
                try runUserMode(vendingMachine)
            case .quit:
                return
            }
        } catch let error as InputView.Error {
            print(error.errorMessage)
            continue
        } catch let error as StockManager.Error {
            print(error.errorMessage)
            continue
        } catch {
            fatalError("unexpected error")
        }
    }
}

func runAdminMode(_ vendingMachine: VendingMachineManagable & VendingMachinePrintable) throws {
    let admin = Administrator(vendingMachine)
    while true {
        OutputView.printAllStock(vendingMachine.readAllStock())
        OutputView.printBeverageMenu()
        OutputView.startAdminModeMessage()
        let (menu, option) = InputView.selectMenu()
        switch menu {
        case ADDBEVERAGE:
            // 추가하려는 메뉴가 있는지 확인하고 있으면 생성해서 자판기에 추가
            guard let beverage = Administrator.makeBeverage(option) else {
                throw Administrator.Error.selectMenuError
            }
            vendingMachine.add(beverage: beverage)
        case REMOVEBEVERAGE:
            admin.removeBeverage(option)
        case REMOVEEXPIRATION:
            admin.removeExpiration()
        case EXITTOSELECTMODE:
            return
        default:
            continue
        }
    }
    
}

func runUserMode(_ vendingMachine: UserAvailable & VendingMachineUserModePrintable) throws {
    let outputView = OutputView(vendingMachine)
    let user = User(vendingMachine)
    OutputView.printAllStock(vendingMachine.readAllStock())
    while true {
        outputView.printBalance()
        outputView.printBuyableProducts()
        outputView.printMenu()
        let (menu, option) = InputView.selectMenu()
        switch menu {
        case INSERTCOIN:
            user.insertCoint(option)
        case BUYBEVERAGE:
            let buyables = vendingMachine.readBuyableProducts()
            OutputView.printSoldBeverage(try vendingMachine.buy(buyables[option - 1]))
        case EXITTOSELECTMODE:
            return
        default:
            continue
        }
    }
    
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
