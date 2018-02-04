//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Product {
    case ChocoMilk
    case BananaMilk
    case Coke
    case Coffee
    case DolceLatte
    case EnergyDrink
}

class VendingMachine {
    private(set) var stockContoller = StockController(items: [Beverage]())
    var balance = 0

    init(stockItems: [Beverage]) {
        self.stockContoller = StockController(items: stockItems)
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

    func buy(itemSelected: ObjectIdentifier) {
        stockContoller.removeItem(itemCode: itemSelected)
        self.subtractBalance(money: stockContoller.priceOfItem(itemSelected))
    }

    func add(item: Beverage) {

    }

    func hotBeverage() -> StockController {
        let hotItems = stockContoller.findHotBeverage()
        return StockController(items: hotItems)
    }

    func history() -> History {
        return stockContoller.makeHistory()
    }

    func showStock() -> String {
        return stockContoller.stockStatus(of: "재고 수량")
    }

    // 유통기한 지난 음료
    func discardItems() -> StockController {
        let discardItems = stockContoller.findDiscardBeverage()
        return StockController(items: discardItems)
    }

    // 유통기한 내의 음료
    func validItems() -> StockController {
        let validItems = stockContoller.findValidBeverage()
        return StockController(items: validItems)
    }

    // 현재 금액으로 구매 가능한 음료수
    func possibleToBuy() -> StockController {
        let validItems = stockContoller.finditemsCheaper(than: self.balance)
        return StockController(items: validItems)
    }


}

/*
 let suitSets = cards.reduce(into: [CardDeck.Suit:[Card]]()) {
 $0[$1.shape(), default:[]].append($1)
 }

 음료의 속성이 필요할땐, stock 내의 set에서 key가 아니라 value에 접근...,.,.

 자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
 자판기 금액을 원하는 금액만큼 올리는 메소드 -ok
 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드 - price속성접근필요
 음료수를 구매하는 메소드-ok
 잔액을 확인하는 메소드-ok
 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드 - ok - stock 필요
 유통기한이 지난 재고만 리턴하는 메소드-ok (valid체크 메소드 파라미터 수정해야함)
 따뜻한 음료만 리턴하는 메소드- ok 유통기한지난재고 메소드처럼
 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
 main에서 음료수 객체 인스턴스를 종류별로 추가하고 자판기 동작을 확인하도록 구현한다.
 */
