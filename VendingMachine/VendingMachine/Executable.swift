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

struct ManagerMode: Executable {
    var vendingMachine: Manager & PrintableForManager

    init(vendingMachine: Manager & PrintableForManager) {
        self.vendingMachine = vendingMachine
    }

    mutating func run() {
        OutputView.clear()
        while(true) {
            do {
                OutputView.start(vendingMachine)
                let input = InputView.readInput()
                if MenuController.finish(keyword: input) { return }
                let menu = try MenuController.readManagerMenu(from: input)

                guard OutputView.proceed(menu: menu, of: vendingMachine) else { continue }
                let numberSelected = InputView.readInput()
                guard let number = Int(numberSelected) else { throw MenuError.notInt }
                let selected = number - 1

                try OutputView.operate(menu: menu, of: vendingMachine, with: selected)
            }  catch let error as MenuError {
                OutputView.showMessage(of: error)
            }  catch let error as VendingMachineError {
                OutputView.showMessage(of: error)
            } catch {
                fatalError("UNEXPECTED ERROR")
            }
        }
    }

}

struct ConsumerMode: Executable {
    var vendingMachine: Consumer & PrintableForConsumer

    init(vendingMachine: Consumer & PrintableForConsumer) {
        self.vendingMachine = vendingMachine
    }

    mutating func run() {
        OutputView.clear()
        while(true) {
            do {
                if vendingMachine.isEmpty() { throw VendingMachineError.outOfStock }
                OutputView.start(vendingMachine)
                let input = InputView.readInput()
                if MenuController.finish(keyword: input) { return }
                let menu = try MenuController.readConsumerMenu(from: input)

                switch menu.item {
                case .insertCoin:
                    let moneyInserted = menu.value
                    guard vendingMachine.insert(money: moneyInserted) else { continue }
                    OutputView.showInsertion(of: moneyInserted)
                case .purchaseBeverage:
                    let listBuyable = vendingMachine.getListBuyable()
                    let beverageSelected = menu.value - 1
                    guard beverageSelected < listBuyable.count else { throw MenuError.outOfList }
                    let packSelected = listBuyable[beverageSelected]
                    guard let beveragePurchased = vendingMachine.buy(beverage: packSelected) else { continue }
                    OutputView.showPurchase(of: beveragePurchased)
                }
            } catch let error as MenuError {
                OutputView.showMessage(of: error)
            } catch let error as VendingMachineError {
                OutputView.showMessage(of: error)
                break
            } catch {
                fatalError("UNEXPECTED ERROR")
            }
        }
    }

}
