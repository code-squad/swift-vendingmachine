//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {

    enum Exception: Error {
        case NotEnoughBalance
        case OutOfStock
    }

    private(set) var stock = Stock(items: [Beverage]())
    private var balance = 0

    init(stockItems: [Beverage]) {
        self.stock = Stock(items: stockItems)
    }

    func matchKey(_ option: Int) -> ObjectIdentifier? {
        switch option {
        case 1: return ObjectIdentifier(EnergyDrink.self)
        case 2: return ObjectIdentifier(ChocoMilk.self)
        case 3: return ObjectIdentifier(DolceLatte.self)
        case 4: return ObjectIdentifier(BananaMilk.self)
        case 5: return ObjectIdentifier(Coffee.self)
        case 6: return ObjectIdentifier(SoftDrink.self)
        default: return nil
        }
    }

    func addBalance(money: Int) {
        balance += money
    }

    func subtractBalance(money: Int) {
        balance -= money
    }

    func showBalance() -> Int {
        return self.balance
    }

    func buy(itemCode: Int) throws -> Beverage {
        let item = matchKey(itemCode)
        guard let code = item else {
            throw Exception.OutOfStock
        }
        let selectedItem = try stock.buy(item: code, balance: self.balance)
        self.subtractBalance(money: stock.priceOfItem(code))
        stock.removeItem(code)
        return selectedItem
    }

    func add(inputItem: Beverage) {
        stock.addItem(item: inputItem)
    }

    func removeItem(itemCode: Int) throws {
        let item = matchKey(itemCode)
        guard let code = item else {
            throw Exception.OutOfStock
        }
        stock.removeItem(code)
    }

    func history() -> String {
        return stock.makeHistory().showHistory()
    }

    // 메뉴선택을 위해 itemCode와 가격까지 보여주는 메소드
    func showStock() -> String {
        return stock.menu(of: " 메뉴를 선택하세요.")
    }

    // 맨 처음 모드 선택시에 보여주는 전체재고상태
    func showStockDefault() -> String {
        return stock.stockSummary()
    }

    // 뜨거운 음료
    func hotBeverage() -> [ObjectIdentifier: [Beverage]] {
        return stock.findHotBeverage()
    }

    // 유통기한 지난 음료
    func discardItems() -> [ObjectIdentifier: [Beverage]] {
        return stock.findDiscardBeverage()
    }

    // 유통기한 내의 음료
    func validItems() -> [ObjectIdentifier: [Beverage]] {
        return stock.findValidBeverage()
    }

    // 현재 금액으로 구매 가능한 음료수
    func possibleToBuy() -> [ObjectIdentifier: [Beverage]] {
        return stock.finditemsCheaper(than: self.balance)
    }

    // 컨트롤러가 계속 구매가능여부를 판단해서 메뉴를 다르게 출력할 수 있도록 가능여부를 리턴. 제일 저렴한 음료의 가격이 자판기를 진행할 수 있는 최소단위
    func hasMiminumBalance() -> Bool {
        return self.balance >= stock.cheapestPrice()
    }
}

