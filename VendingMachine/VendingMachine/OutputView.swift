//
//  OutputView.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol AdminPrintable {
    func printAdminModeBaseMessages(_ adminVendingMachine: AdminMode)
    func printAdminModeMessage(_ message: OutputView.AdminModeMessages)
    func printHisotry(_ history: [Beverage])
}

protocol UserPrintable {
    func printUserModeMessage(_ message: OutputView.UserModeMessages)
    func printUserModeBaseMessages(_ userVendingMachine: UserMode)
    func printBuyProduct(_ userProduct: Beverage, productPrice: Int)
}

struct OutputView: AdminPrintable, UserPrintable {

    enum ModeSelectionMessages: String {
        case menu = "자판기를 시작합니다.\n1. 관리자 모드\n2. 사용자 모드\n3. 자판기 종료"
        case invalidMenu = "잘못된 모드를 입력하셨습니다. 다시 입력해주세요."
    }

    enum AdminModeMessages: String {
        case adminMode = "관리자 모드입니다. 현재 음료는 다음과 같습니다."
        case menu = "1. 재고추가\n2. 재고삭제\n3. 구매내역\n4. 관리자모드 종료"
        case addProduct = "추가할 음료를 선택해주세요."
        case removeProduct = "삭제할 음료를 선택해주세요"
        case invalidMenu = "잘못된 번호를 입력하셨습니다. 다시 입력해주세요."
        case noProduct = "삭제할 음료가 없습니다."
    }

    enum UserModeMessages: String {
        case menu = "1. 금액추가\n2. 음료구매\n3. 사용자모드 종료"
        case addMoney = "투입할 금액을 입력해주세요."
        case chooseProduct = "구매하실 음료번호를 입력해주세요."
        case invalidMenu = "잘못된 번호를 입력하셨습니다. 다시 입력해주세요."
        case shortOfMoney = "금액이 부족합니다."
    }

    func printAdminModeBaseMessages(_ adminVendingMachine: AdminMode) {
        printAdminModeMessage(.adminMode)
        printProducts((adminVendingMachine as? VendingMachine) ?? VendingMachine(productsBox: []))
        printAdminModeMessage(.menu)
    }

    func printUserModeBaseMessages(_ userVendingMachine: UserMode) {
        printInformation(userVendingMachine)
        printProducts((userVendingMachine as? VendingMachine) ?? VendingMachine(productsBox: []))
        printUserModeMessage(.menu)
    }

    func printBuyProduct(_ userProduct: Beverage, productPrice: Int) {
        print("\(String(describing: type(of: userProduct).self))를 구매하셨습니다. \(productPrice)을 차감합니다.")
    }

    func printModeSelectMessage(_ message: ModeSelectionMessages) {
        print("\(message.rawValue)")
    }

    func printUserModeMessage(_ message: UserModeMessages) {
        print("\(message.rawValue)")
    }

    func printAdminModeMessage(_ message: AdminModeMessages) {
        print("\(message.rawValue)")
    }

    private func printInformation(_ vendingMachine: UserMode) {
        print("현재 투입한 금액은 \(vendingMachine.getBalance())원 입니다. 다음과 같은 음료가 있습니다.")
    }

    private func printProducts(_ machine: VendingMachine) {
        var productNumber = 1
        for oneProductName in machine.generateListOfProduct() {
            let oneProduct = machine.generateBeverageFromProductName(oneProductName)
                ?? Beverage(brand: "", name: "", volume: 0, price: 0, manufacturedDate: Date())
            print("""
            \(productNumber)) \(String(describing: type(of: oneProduct).self)) \(oneProduct.price)원 (\(machine.generateCountOfProduct(oneProductName))개)
            """)
            productNumber += 1
        }
    }

    func printHisotry(_ history: [Beverage]) {
        var historyNumber = 1
        for oneHistory in history {
            print("\(historyNumber). \(oneHistory)")
            historyNumber += 1
        }
    }

}
