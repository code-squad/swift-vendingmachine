//
//  performable.swift
//  VendingMachine
//
//  Created by Elena on 25/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// MARK: - Protocol SelectMode
protocol SelectMode {
    mutating func perform()
    
}

// MARK: - Struct ManagerMode
struct ManagerMode {
    
    private var vendingMachine: Manager & VendingMachineShowManager
    
    init(vendingMachine: Manager & VendingMachineShowManager) {
        self.vendingMachine = vendingMachine
    }
    
    private func readMenu() throws -> ManagerMenuScript? {
        OutputView.start(vendingMachine)
        let input = InputView.readInput()
        if Menu.moveHighStep(input: input) { return nil }
        return try Menu.readManagerMenu(input: input)
    }
    
    private func removeGobadBeverages() {
        let goBadGoods = vendingMachine.removeGoBadBeverages()
        //OutputView.showListRemoved(beverages: goBadGoods)
    }
    
    private func readValue() throws -> Int {
        let input = InputView.readInput()
        guard let value = Int(input) else { throw MenuError.noNumberGoods }
        return value - 1
    }
    
    private func select(menu: ManagerMenuScript) -> Bool {
        switch menu {
        case .addBeverage, .removeBeverage:
            OutputView.question(value: menu)
            return false
        case .removeGoBadBeverages:
            removeGobadBeverages()
        }
        return true
    }
    
    private func addBeverage(number: Int) throws {
        guard vendingMachine.add(beverage: number) else { throw VendingMachineError.notAddition }
        OutputView.showAddMsg(beverage: number)
    }
    
    
}

// MARK: - Struct CustomerMode
struct CustomerMode {
    private var vendingMachine: Customer & VendingMachineShowCustomer

    init(vendingMachine: Customer & VendingMachineShowCustomer) {
        self.vendingMachine = vendingMachine
    }

    private func readMenu() throws -> (details: CustomerMenuScript, value: Int)? {
        OutputView.start(vendingMachine)
        let input = InputView.readInput()
        if Menu.moveHighStep(input: input) { return nil }
        return try Menu.readCustomerMenu(input: input)
    }

}

// MARK: - extension ManagerMode: SelectMode
extension ManagerMode: SelectMode {

    mutating func perform() {
        while true {
            do {
                guard let menu = try readMenu() else { return }
                if select(menu: menu) { continue }
                let value = try readValue()
                
                switch menu {
                case .addBeverage:
                    try addBeverage(number: value)
                case .removeBeverage:
                    break
                    //try removeBeverage(beverage: value)
                default:
                    continue
                }

            } catch let error as MenuError {
                OutputView.showMessage(error: error)
            } catch let error as MenuError {
                OutputView.showMessage(error: error)
            } catch {
                OutputView.showMessage(error: MenuError.notDefine)
            }
        }
    }

}

// MARK: - extension CustomerMode: SelectMode
extension CustomerMode: SelectMode {

    mutating func perform() {
        while true {
            do {
                guard let menu = try readMenu() else { return }
                
//                switch menu.value {
//                case .returnChange : break
//                case .addMoney: break
//                case .buyBeverage: break
//                default: break
//                }
                
            } catch let error as MenuError {
                OutputView.showMessage(error: error)
            } catch let error as MenuError {
                OutputView.showMessage(error: error)
                break
            } catch {
                OutputView.showMessage(error: MenuError.notDefine)
            }
        }
    }

}

