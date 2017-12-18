//
//  UserController.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 14..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation



struct UserController {
    var user: VendingMachineUser

    init(vendingMachine: VendingMachine) {
        user = VendingMachineUser.init(vendingMachine: vendingMachine)
    }

    mutating func use() {
        var selector: Selector = (menu: ValidationChecker.VendingMenu.none, contents: 0)
        while selector.menu == ValidationChecker.VendingMenu.none {
            let inventory: Inventory = user.getInventory()
            let buyableProducts: Array<Category> = user.getBuyableProducts()
            showVendingMachine(inventory: inventory, buyableProducts: buyableProducts)
            do {
                selector = try ValidationChecker.getSelector(input: InputView.readInput())
            } catch ValidationChecker.Errors.quit {
                print(ValidationChecker.Errors.quit)
                break
            } catch {
                print(ValidationChecker.Errors.invalidInput)
                continue
            }
            selectMenu(selector: selector, inventory: inventory, buyableProducts: buyableProducts)
            selector = (menu: ValidationChecker.VendingMenu.none, contents: 0)
        }
    }

    private func showVendingMachine(inventory: Inventory, buyableProducts: Array<Category>) {
        print("\n======= 자판기 =======")
        if buyableProducts.count == 0 {
            print("현재 금액으로 살 수 있는 음료가 없습니다.")
            OutputView.show(inventory: inventory)
        } else {
            OutputView.show(balance: user.getBalance())
            OutputView.show(inventory: inventory, buyableProducts: buyableProducts)
        }
        OutputView.showMenu()
    }

    mutating private func selectMenu(selector: Selector, inventory: Inventory, buyableProducts: Array<Category>) {
        switch selector.menu {
        case .insertCoins:
            user.insertCoins(selector.contents)
        case .buyProduct where selector.contents <= buyableProducts.count:
            user.buy(category: buyableProducts[selector.contents-1])
            print("\(buyableProducts[selector.contents-1])를 구매하셨습니다. \(String(describing: inventory[buyableProducts[selector.contents-1]]![0].price))원을 차감합니다.")
        case .purchaseList:
            print("현재까지 구매 내역입니다.")
            OutputView.show(products: user.purchaseList)
        default:
            return
        }
    }

}
