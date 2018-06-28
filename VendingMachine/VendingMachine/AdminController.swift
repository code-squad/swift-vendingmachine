//
//  VendingmachineController.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 6. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct AdminController {
    
    private let vendingmachine: AdminVendingmachine
    private let outputView: AdminOutputView
    
    init(_ vendingmachine: AdminVendingmachine,_ outputView: AdminOutputView) {
        self.vendingmachine = vendingmachine
        self.outputView = outputView
    }
    
    private let beverageSet = BeverageFactory().setBeverage()
    private let inputView = InputView()
    
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
    private func addInventory() {
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
    private func removeInventory() {
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
