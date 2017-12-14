//
//  UserController.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 14..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct UserController {
    let vendingMachine: VendingMachine
    var user: VendingMachineUser

    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
        user = VendingMachineUser.init(vendingMachine: vendingMachine)
    }

    mutating func use() {
        var selector: (ValidationChecker.VendingMenu, Int) = (ValidationChecker.VendingMenu.none, 0)
        while selector.0 == ValidationChecker.VendingMenu.none {
            print("\n======= 자판기 =======")
            let inventory: Inventory = user.getInventory()
            let buyableProducts: Array<Category> = user.getBuyableProducts()
            if buyableProducts.count == 0 {
                print("현재 금액으로 살 수 있는 음료가 없습니다.")
                OutputView.show(inventory: inventory)
            } else {
                OutputView.show(balance: user.getBalance())
                OutputView.show(inventory: inventory, buyableProducts: buyableProducts)
            }
            OutputView.showMenu()
            do {
                selector = try ValidationChecker.getSelector(input: InputView.readInput())
            } catch ValidationChecker.Errors.invalidInput {
                print(ValidationChecker.Errors.invalidInput)
                continue
            } catch ValidationChecker.Errors.quit {
                print(ValidationChecker.Errors.quit)
                break
            } catch {
                print(ValidationChecker.Errors.invalidInput)
                continue
            }
            switch selector.0 {
            case .insertCoins:
                user.insertCoins(selector.1)
            case .buyProduct where selector.1 <= buyableProducts.count:
                user.buy(category: buyableProducts[selector.1-1])
                print("\(buyableProducts[selector.1-1])를 구매하셨습니다. \(String(describing: inventory[buyableProducts[selector.1-1]]![0].price))원을 차감합니다.")
            case .purchaseList:
                print("현재까지 구매 내역입니다.")
                OutputView.show(products: user.purchaseList)
            default:
                continue
            }
            selector = (ValidationChecker.VendingMenu.none, 0)
        }
    }

}
