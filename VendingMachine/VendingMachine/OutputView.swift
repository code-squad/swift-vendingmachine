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
        case invalidBalance = "1000원이상 금액을 추가하셔야 음료 구매가 가능합니다"
        case exit = "프로그램을 종료합니다."
    }
    
    let vendingmachine: Vendingmachine
    
    init(_ vendingmachine: Vendingmachine) {
        self.vendingmachine = vendingmachine
    }
    
    func showMessagesSet(_ coin: Int) {
        showInformation()
        if coin == 0 {
            showInventory()
        } else {
            showBeveragesList()
        }
        showMessages(.memu)
        print("> ", terminator: "")
    }
    
    func showMessages(_ message: Messages) {
        print(message.rawValue)
    }
    
    private func showInformation() {
        print("현재 투입한 금액이 \(vendingMachine.checkBalance())원 입니다. 다음과 같은 음료가 있습니다.")
    }
    
    private func showInventory() {
        print("=> ", terminator: "")
        let kind = vendingmachine.makeKindOfBeverage()
        for item in kind {
            let beverage = vendingmachine[item]
            if let kind = beverage?.map({$0.kind}) {
                print("\(kind.first ?? "")(\(kind.count)개) ", terminator: "")
            }
        }
    }
    
    func showBeveragesList() -> [String] {
        var order = 1
        var kindOfBeverge: [String] = []
        let buyableList = vendingMachine.buyableOfList()
        for buyable in buyableList {
            let list = vendingMachine[buyable]
            if let kind = list?.map({$0.kind}), let price = list?.map({$0.price}) {
                print("\(order))\(kind.first ?? "") \(price.first ?? 0)원(\(kind.count)개)")
                kindOfBeverge.append(kind.first ?? "")
            }
            order += 1
        }
        return kindOfBeverge
    }

    func showPurchases(_ purchases: String,_ price: Int) {
        print("\(purchases)를 구매하셨습니다. \(price)원을 차감합니다.\n")
    }
    
    func showPurchasesList() {
        let purchases = vendingmachine.checkPurchases()
        guard !purchases.isEmpty else { print("구매하신 음료가 없습니다 ")
            return }
        let item = purchases.map({$0.kind})
        print("구매목록: \(item) ")
    }

}
