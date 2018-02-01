//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var stock = [Beverage: [Beverage]]()
    var balance = 0
    var history = [Beverage]()

    init(stock: [Beverage: [Beverage]]) {
        self.stock = stock
    }

    func addBalance(money: Int) {
        // 컨트롤러에서 자판기 투입금액 받음
        balance += money
    }

    func subtractBalance(money: Int) {
        balance -= money
    }

    func showBalance() -> Int {
        return self.balance
    }

    func buy() {
        // 음료수 구매
        // substractBalance(음료수금액)
    }

    func hotBeverage() {
        // 따듯한 음료만 리턴
    }

    func inValidDate() {
        // 유통기한 지는 음료만
    }

    func validDate() {
        // 유통기한 내의 음료만
    }

    func purchaseHistory() ->[Beverage] {
        return history
    }

    func showStock() -> String {
        var result = "<< 재고 수량 >> \n"
        self.stock.forEach { set in
            result += "\(set.key.description) : \(set.value.count)개 \n"
        }
        return result
    }

    func showDiscard() -> [Beverage: [Beverage]] {
        var discards = [Beverage]()
        for set in self.stock {
            for product in set.value {
                if product.validate(duration: 3) {
                    discards.append(product)
                }
            }
        }
        let discardSet = discards.reduce(into: [Beverage: [Beverage]]()) {
            $0[$1, default:[]].append($1)
        }
        return discardSet
    }

}

/*
 let suitSets = cards.reduce(into: [CardDeck.Suit:[Card]]()) {
 $0[$1.shape(), default:[]].append($1)
 }

 자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
 자판기 금액을 원하는 금액만큼 올리는 메소드 -ok
 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드 - price속성필요
 음료수를 구매하는 메소드-
 잔액을 확인하는 메소드-ok - balance 속성필요
 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드 - ok - stock 필요
 유통기한이 지난 재고만 리턴하는 메소드-ok (valid체크 메소드 파라미터 수정해야함)
 따뜻한 음료만 리턴하는 메소드- 유통기한지난재고 메소드처럼
 시작이후 구매 상품 이력을 배열로 리턴하는 메소드 - ok
 main에서 음료수 객체 인스턴스를 종류별로 추가하고 자판기 동작을 확인하도록 구현한다.
 */
