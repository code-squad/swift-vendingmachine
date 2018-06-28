//
//  UserOutputView.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 6. 28..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Messages: String {
    case menu = "\n1. 금액추가\n2. 음료구매\n3. 구매이력 확인\n4. 종료"
    case mode = "1. 관리자 모드\n2. 사용자 모드"
    case controlInventory = "1. 재고 추가\n2. 재고 삭제"
    case addMoney = "투입할 금액을 입력해주세요."
    case chooseBeverage = "구매하실 음료번호를 입력해주세요."
    case invalidMenu = "잘못된 번호를 입력하셨습니다. 다시 입력해주세요."
    case lowBalance = "잔액이 부족합니다."
    case invalidBalance = "1000원이상 금액을 추가하셔야 음료 구매가 가능합니다."
    case addInventory = "재고에 추가하실 음료번호를 입력해주세요."
    case removeInventory = "재고에서 삭제하실 음료번호를 입력해주세요"
    case start = "자판기를 시작합니다."
    case exit = "프로그램을 종료합니다."
}


protocol PrintMessages {
    func showMessages(_ message: Messages)
    func showInputLine()
}


struct UserOutputView: PrintMessages {
    
    private let vendingmachine: UserVendingmachine
    
    init(_ vendingmachine: UserVendingmachine) {
        self.vendingmachine = vendingmachine
    }
    
    func showMessagesSet(_ coin: Int) {
        showInformation()
        if coin == 0 {
            showInventory()
        } else {
            showBeveragesList()
        }
        showMessages(.menu)
        showInputLine()
    }
    
    private func showInformation() {
        print("현재 투입한 금액이 \(vendingmachine.checkBalance())원 입니다. 다음과 같은 음료가 있습니다.")
    }
    
    // 사용자모드에서 금액 충전하기전 보여주는 재고 목록
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
    
    // 구입가능한 음료 리스트 보기
    func showBeveragesList() -> [String] {
        var order = 1
        var kindOfBeverge: [String] = []
        let buyableList = vendingmachine.buyableOfList()
        for buyable in buyableList {
            let list = vendingmachine[buyable]
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
    
    //구매한 음료
    func showPurchasesList() {
        let purchases = vendingmachine.checkPurchases()
        guard !purchases.isEmpty else { print("구매하신 음료가 없습니다 ")
            return }
        let item = purchases.map({$0.kind})
        print("구매목록: \(item) ")
    }
    
    func showMessages(_ message: Messages) {
        print(message.rawValue)
    }
    
    func showInputLine() {
        print("> ", terminator: "")
    }
}
