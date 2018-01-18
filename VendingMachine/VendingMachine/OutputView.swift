//
//  OutputView.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    enum Messages : String {
        case menu = "1. 금액추가\n2. 음료구매\n3. 구매이력 확인\n4. 종료"
        case addMoney = "투입할 금액을 입력해주세요."
        case chooseProduct = "구매하실 음료번호를 입력해주세요."
        case invalidMenu = "잘못된 번호를 입력하셨습니다. 다시 입력해주세요."
        case shortOfMoney = "금액이 부족합니다."
    }
    
    func printBaseMessages(_ userVendingMachine : VendingMachine) {
        printInformation(userVendingMachine)
        printProducts(userVendingMachine)
        printMessage(.menu)
    }
    
    func printBuyProduct(_ userProduct : String, productPrice : Int) {
        print("\(userProduct)를 구매하셨습니다. \(productPrice)을 차감합니다.")
    }
    
    
    func printMessage(_ message : Messages) {
        print("\(message.rawValue)")
    }
    
    func printInformation(_ vendingMachine : VendingMachine) {
        print("현재 투입한 금액은 \(vendingMachine.getBalance())원 입니다. 다음과 같은 음료가 있습니다.")
    }
    
    func printProducts(_ vendingMachine : VendingMachine) {
        var productNumber = 1
        for oneProduct in vendingMachine.getInventory() {
            print("\(productNumber)) \(oneProduct.key) \(oneProduct.value[0].price)원 (\(oneProduct.value.count)개)")
            productNumber += 1
        }
    }
    
    func printHisotry(_ history : [Beverage]) {
        var historyNumber = 1
        for oneHistory in history {
            print("\(historyNumber). \(oneHistory)")
            historyNumber += 1
            
        }
    }
}
