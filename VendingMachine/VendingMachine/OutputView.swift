//
//  OutputView.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 31..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    enum Messages: String {
        case memu = "\n1. 금액추가\n2. 음료구매\n3. 구매이력 확인\n4. 종료"
        case addMoney = "투입할 금액을 입력해주세요."
        case chooseBeverage = "구매하실 음료번호를 입력해주세요."
        case invalidMenu = "잘못된 번호를 입력하셨습니다. 다시 입력해주세요."
        case lowBalance = "잔액이 부족합니다."
        case exit = "프로그램을 종료합니다."
    }
    
    func showMessagesSet(_ vendingmachine: Vendingmachine,_ coin: Int) {
        showInformation(vendingmachine)
        if coin == 0{
            showInventory(vendingmachine)
        } else {
            showBeveragesList(vendingmachine)
        }
        
        showMessages(.memu)
        print("> ", terminator: "")
    }
    
    func showMessages(_ message: Messages) {
        print(message.rawValue)
    }
    
    private func showInformation(_ vendingmachine: Vendingmachine) {
        print("현재 투입한 금액이 \(vendingMachine.checkBalance())원 입니다. 다음과 같은 음료가 있습니다.")
    }
    
    private func showInventory(_ vendingmachine: Vendingmachine) {
        print("=> ", terminator: "")
        for item in vendingMachine.inventory.values {
            let beverages = item.map({$0.kind})
            print("\(beverages.first ?? "")(\(beverages.count)개) ", terminator: "")
        }
    }
    
    func showBeveragesList(_ vendingmachine: Vendingmachine) -> [String] {
        var order = 1
        var kindOfBeverge: [String] = []
        for item in vendingmachine.inventory.values {
            let inventoryList = item.map({$0.kind})
//            let buyableList = vendingmachine.buyableOfList()
//            let beverages = inventoryList.filter({buyableList.contains($0)})
            let price = item.map({$0.price})
            let kind = inventoryList.first ?? ""
            kindOfBeverge.append(kind)
            print("\(order))\(kind) \(price.first ?? 0)원(\(inventoryList.count)개)")
            order += 1
        }
        return kindOfBeverge
    }

    func showPurchases(_ purchases: String,_ price: Int) {
        if purchases == "" || price == 0 {
            print("품절된 상품 입니다. 다시 선택해주세요")
        } else {
            print("\(purchases)를 구매하셨습니다. \(price)원을 차감합니다.")
        }
        print("")
    }
    
    func showPurchasesList(_ vendingmachine: Vendingmachine) {
        let purchases = vendingmachine.purchases
        
        if purchases.isEmpty {
            print("구매하신 음료가 없습니다 ")
        } else {
            let item = purchases.map({$0.kind})
            print("구매목록: \(item) ")
        }
    }
    
    
}
