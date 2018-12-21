//
//  VendingMachineExecutable.swift
//  VendingMachine
//
//  Created by 윤지영 on 20/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol Executable {
    mutating func run()
}

extension ManagerMode: Executable {

    mutating func run() {
        while(true) {
            do {
                guard let menu = try readMenu() else { return }
                if complete(menu: menu) { continue }
                let value = try readValue()
                switch menu {
                case .addBeverage:
                    try addBeverage(of: value)
                case .removeBeverage:
                    try removeBeverage(of: value)
                default:
                    continue
                }
            }  catch let error as MenuError {
                OutputView.showMessage(of: error)
            }  catch let error as VendingMachineError {
                OutputView.showMessage(of: error)
            } catch {
                OutputView.showUnexpected(error: error)
            }
        }
    }

}

extension ConsumerMode: Executable {

    mutating func run() {
        while(true) {
            do {
                guard let menu = try readMenu() else { return }
                switch menu.item {
                case .insertCoin:
                    guard insert(money: menu.value) else { continue }
                case .purchaseBeverage:
                    guard try purchase(beverage: menu.value) else { continue }
                }
            } catch let error as MenuError {
                OutputView.showMessage(of: error)
            } catch let error as VendingMachineError {
                OutputView.showMessage(of: error)
                break
            } catch {
                OutputView.showUnexpected(error: error)
            }
        }
    }

}

struct ManagerMode {
    private var vendingMachine: Manager & PrintableForManager

    init(vendingMachine: Manager & PrintableForManager) {
        self.vendingMachine = vendingMachine
    }

    private func readMenu() throws -> ManagerMenuItem? {
        OutputView.start(vendingMachine)
        let input = InputView.readInput()
        if MenuController.finish(keyword: input) { return nil }
        return try MenuController.readManagerMenu(from: input)
    }

    private func removeExpiredBeverages() {
        let expired = vendingMachine.removeExpiredBeverages()
        OutputView.showListRemoved(beverages: expired)
    }

    private func readValue() throws -> Int {
        let input = InputView.readInput()
        guard let number = Int(input) else { throw MenuError.notInt }
        return number - 1
    }

    private func complete(menu: ManagerMenuItem) -> Bool {
        switch menu {
        case .addBeverage, .removeBeverage:
            OutputView.askValue(of: menu)
            return false
        case .removeExpiredBeverages:
            removeExpiredBeverages()
        case .readHistory:
            OutputView.showHistory(of: vendingMachine)
        }
        return true
    }

    private func addBeverage(of number: Int) throws {
        guard vendingMachine.add(beverage: number) else { throw VendingMachineError.notExistPack }
        OutputView.showAddition(of: number)
    }

    private func removeBeverage(of number: Int) throws {
        guard let beverage = vendingMachine.remove(beverage: number) else { throw VendingMachineError.cannotRemove }
        OutputView.showRemoval(of: beverage)
    }

}

struct ConsumerMode {
    private var vendingMachine: Consumer & PrintableForConsumer

    init(vendingMachine: Consumer & PrintableForConsumer) {
        self.vendingMachine = vendingMachine
    }

    private func readMenu() throws -> (item: ConsumerMenuItem, value: Int)? {
        if vendingMachine.isEmpty() { throw VendingMachineError.outOfStock }
        OutputView.start(vendingMachine)
        let input = InputView.readInput()
        if MenuController.finish(keyword: input) { return nil }
        return try MenuController.readConsumerMenu(from: input)
    }

    mutating private func insert(money: Int) -> Bool {
        guard vendingMachine.insert(money: money) else { return false }
        OutputView.showInsertion(of: money)
        return true
    }

    mutating private func purchase(beverage: Int) throws -> Bool {
        let list = vendingMachine.getListBuyable()
        let number = beverage - 1
        guard number < list.count else { throw MenuError.outOfList }
        let pack = list[number]
        guard let beverage = vendingMachine.buy(beverage: pack) else { return false }
        OutputView.showPurchase(of: beverage)
        return true
    }

}
