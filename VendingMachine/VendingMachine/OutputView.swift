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
        print("1. 재고추가\n2. 재고삭제")
        print("3. 유통기한지난 음료 삭제")
    }

    func printBalance() {
        print("현재 투입한 금액이 \(vendingMachine.readBalance())원 입니다.")
    }

    func printAllStock() {
        print("===========전체 재고 목록==========")
        for stock in self.vendingMachine.readAllStock() {
            print("\(stock.beverageType)(\(stock.count)개)")
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
        print("Q. 사용종료")
        print("1. 금액추가")
        print("2. 음료구매", terminator: "\n> ")
    }
    
    func printSoldBeverage(_ soldBeverage: Beverage) {
        print("\(soldBeverage)를 구매하셨습니다. \(abs(soldBeverage.minusBeveragePrice(from: 0)))원을 차감합니다.")
    }
}
