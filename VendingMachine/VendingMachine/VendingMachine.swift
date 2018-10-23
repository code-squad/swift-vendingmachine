//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var stocks: Stocks
    private var account: Int = 0
    private (set) var history = History()
    var bundles: Bundles {
        return stocks.bundles
    }
    // 금액을 넣고 잔액을 확인할 수 있는 프로퍼티
    var remain: Int {
        set {
            account += newValue
        }
        get {
            return account
        }
    }
    
    init(_ stocks: Stocks) {
        self.stocks = stocks
    }
    
    func append(_ beverage: Beverage) {
        stocks.append(beverage)
    }
    
    // 현재 잔액으로 구매할 수 있는 음료 목록
    func availables(with money: Int) -> [Beverage] {
        return stocks.availables(with: money)
    }
    
    // 음료수 구매 메소드
    func buy(at index: Int) throws -> Beverage {
        let beverage = bundles.get(at: index)
        let price = try stocks.buy(at: beverage, account)
        account -= price
        history.append(beverage)
        return beverage
    }
}
