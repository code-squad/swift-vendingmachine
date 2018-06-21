//
//  OutputView.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 14..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol VendingMachinePrintable {
    func readBalance() -> Int
    func readAllStock() -> [Products]
    func readBuyableProducts() -> [Products]
    func readStock(_ productType: ObjectIdentifier) -> Int
    func buy(_ products: Products) throws -> Beverage
}

enum BeverageMenu: String, CaseIterable {
    case 티오피
    case 칸타타
    case 조지아
    case 딸기우유
    case 초코우유
    case 콜라
    case 사이다
}

struct OutputView {
    
    private var vendingMachine: VendingMachinePrintable
    
    init(_ vendingMachine: VendingMachinePrintable) {
        self.vendingMachine = vendingMachine
    }
    
    static func startMessage() {
        print("자판기를 시작합니다.\n1. 관리자모드\n2. 사용자모드\nQ. 사용종료\n> ", terminator: "")
    }
    
    static func startAdminModeMessage() {
        print("관리자모드를 시작합니다.")
        print("0. 모드 선택 메뉴로")
        print("1. 재고추가")
        print("2. 재고삭제")
        print("3. 유통기한 지난 음료 삭제\n> ", terminator: "")
    }

    func printBalance() {
        print("현재 투입한 금액이 \(vendingMachine.readBalance())원 입니다.")
    }

    static func printAllStock(_ stock: [Products]) {
        print("===========전체 재고 목록==========")
        for index in stock.indices {
            print("\(index+1)) \(stock[index].beverageType)(\(stock[index].count)개)")
        }
        print("================================")
    }

    func printBuyableProducts() {
        let buyableProducts = self.vendingMachine.readBuyableProducts()
        print("=========현재 잔액으로 구매가능한 음료===========")
        for index in buyableProducts.indices {
            print("\(index+1))\(buyableProducts[index].beverageType) \(buyableProducts[index].productPrice)원 재고: \(buyableProducts[index].count)개")
        }
        print("=========================================")
    }

    func printMenu() {
        print("0. 모드 선택 메뉴로")
        print("1. 금액추가")
        print("2. 음료구매", terminator: "\n> ")
    }
    
    func printSoldBeverage(_ soldBeverage: Beverage) {
        print("\(soldBeverage)를 구매하셨습니다. \(abs(soldBeverage.minusBeveragePrice(from: 0)))원을 차감합니다.")
    }
    
    static func printBeverageMenu() {
        
        print("=============추가 가능 메뉴==============")
        for index in BeverageMenu.allCases.indices {
            print("\(index+1). \(BeverageMenu.allCases[index])")
        }
        print("=====================================")
    }
}


