//
//  Stocks.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Stocks {
    private var bundles: [[Beverage]]
    var availables: [(Beverage, Int)] {
        let beverages = bundles.compactMap { $0.first }
        let counts = bundles.compactMap {$0.count}
        
        return zip(beverages, counts).compactMap { ($0, $1)}
    }
    init(_ list: [Beverage]) {
        // 종류 별로 묶음
        self.bundles = Dictionary(grouping: list, by: { $0.className }).values.map { $0 }
    }
    
    func append(_ beverage: Beverage) {
        let result = bundles.filter { $0.first?.className == beverage.className }
        var bundle = result.first
        bundle?.append(beverage)
    }
    
    func hasBundle(_ value: Int) -> Bool {
        return value <= bundles.count
    }
    
    // 현재 잔액으로 구매할 수 있는 음료 목록
    func availables(with money: Int) -> [Beverage] {
        return bundles.compactMap { $0.first }.filter { $0.isPurchasable(with: money) }
    }
    
    // 음료수 구매 메소드
    func buy(at index: Int, _ account: Int) throws -> Beverage {
        let beverage = bundles[index - 1].removeFirst()
        if !beverage.isPurchasable(with: account) { throw VendingMachineError.outOfBudget }
        return beverage
    }
}
