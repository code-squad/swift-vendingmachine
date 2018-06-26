//
//  VendingmachineController.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 6. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingmachineController {
    
    let vendingmachine: Vendingmachine
    let outputView: OutputView
    var coin: Int
    
    init(_ vendingmachine: Vendingmachine,_ outputView: OutputView,_ coin: Int) {
        self.vendingmachine = vendingmachine
        self.outputView = outputView
        self.coin = coin
    }
    
    let beverageSet = BeverageFactory().setBeverage()
    let inputView = InputView()
    
    //사용자모드
    mutating func runUserMode() {
        var user = true
        while user {
            outputView.showMessagesSet(coin)
            let menu = inputView.inputMenu()
            switch menu {
            case .inputCoin:
                addInputCoin()
            case .purchasesBeverage:
                buyBeverage()
            case .showPurchases:
                outputView.showPurchasesList()
            case .exit:
                outputView.showMessages(.exit)
                user = false
                run = false
            case .invalidMenu:
                outputView.showMessages(.invalidMenu)
            }
        }
    }
    
    //금액 추가
    mutating func addInputCoin() {
        outputView.showMessages(.addMoney)
        self.coin = inputView.inputCoin()
        vendingmachine.addBalance(coin)
    }
    
    //음료 구매
    func buyBeverage() {
        var buy = true
        while buy {
            let balance = vendingmachine.checkBalance()
            if balance < 1000 {
                outputView.showMessages(.invalidBalance)
                buy = false
                continue
            }
            outputView.showMessages(.chooseBeverage)
            let kindOfBeverage = outputView.showBeveragesList()
            let inputNumber = inputView.inputNumberOfBeverage()
            let range = vendingmachine.makeKindOfBeverage().count
            let kind = kindOfBeverage[inputNumber-1]
            guard inputNumber <= range else { outputView.showMessages(.invalidMenu)
                continue }
            let price = vendingmachine.makePriceOfBeverage(kind)
            guard price < balance else { outputView.showMessages(.lowBalance)
                continue }
            vendingmachine.buyBeverage(kind)
            outputView.showPurchases(kind, price)
            buy = false
        }

    }
    
    //관리자모드
    func runAdminMode() {
        outputView.showMessages(.controlInventory)
        outputView.showInputLine()
        let controlNumber = inputView.inputControlNumber()
        var admin = true
        while admin {
            switch controlNumber {
            case 1:
                addInventory()
            case 2:
                removeInventory()
            default:
                outputView.showMessages(.invalidMenu)
                admin = false
                continue
            }
            admin = false
        }
    }
    
    //재고 추가
    func addInventory() {
        var add = true
        let kindDictionary = ["칸타타": Cantata(), "딸기우유": StrawberryMilk(), "팹시콜라": Coke(), "초코우유": ChocoMilk(), "티오피": Top(), "스프라이트": Sprite(), "바나나우유": BananaMilk(), "조지아": Georgia(), "환타": Fanta()]
        while add {
            outputView.showMessages(.addInventory)
            let kindOfBeverage = outputView.showInventoryList()
            print(kindOfBeverage.count)
            let inputNumber = inputView.inputNumberOfBeverage()
            guard inputNumber <= kindOfBeverage.count else { outputView.showMessages(.invalidMenu)
                add = false
                continue
            }
            let kind = kindOfBeverage[inputNumber-1]
            if let beverageInstance = kindDictionary[kind] {
                vendingmachine.addPurchases(beverageInstance)
            }
            outputView.showInventoryList()
            add = false
        }
    }
    
    //재고 삭제
    func removeInventory() {
        var remove = true
        while remove {
            outputView.showMessages(.removeInventory)
            let kindOfBeverage = outputView.showInventoryList()
            let inputNumber = inputView.inputNumberOfBeverage()
            guard inputNumber <= kindOfBeverage.count else { outputView.showMessages(.invalidMenu)
                remove = false
                continue
            }
            let kind = kindOfBeverage[inputNumber-1]
            vendingmachine.removeInventory(kind)
            outputView.showInventoryList()
            remove = false
        }
    }

}
