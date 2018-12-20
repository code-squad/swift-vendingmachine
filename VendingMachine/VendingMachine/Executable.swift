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
        while(true) {
            do {
                OutputView.start(vendingMachine)
                let input = InputView.readInput()
                let menu = try MenuController.readManagerMenu(from: input)
                if menu == .removeExpiredBeverages {
                    let expiredBeverages = vendingMachine.removeExpiredBeverages()
                    print("\(expiredBeverages) 제거됨")
                    continue
                }

                let numberSelected = InputView.readInput()
                guard let number = Int(numberSelected) else { throw MenuError.notInt }
                let list = vendingMachine.getListOfAll()
                guard number < list.count else { throw MenuError.outOfList }
                let selected = number - 1
                let packSelected = list[selected]

                switch menu {
                case .addBeverage:
//                    guard vendingMachine.add(beverage: packSelected) else { throw VendingMachineError.notExistPack }
                    print("\(packSelected) 추가됨")
                case .removeBeverage:
                    guard let removed = vendingMachine.remove(beverage: packSelected) else { continue }
                    print("\(removed) 제거됨")
                default:
                    continue
                }
            }  catch let error as MenuError {
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
        while(true) {
            do {
                if vendingMachine.isEmpty() { throw VendingMachineError.outOfStock }
                OutputView.start(vendingMachine)
                let input = InputView.readInput()
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
