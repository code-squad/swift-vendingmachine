//
//  StockManager.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct StockManager: Equatable {
    
    var stock: [ProductType:Products]
    
    init(stock: [ProductType:Products]) {
        self.stock = stock
    }
    
    mutating func add(beverage: Beverage) {
        guard let productType = beverage.productType else {
            return
        }
        if let _ = self.stock[productType] {
            // 바인딩 값으로 쓸 경우 '바인딩변수'.append(beverage)를 할 경우 값 타입이라 기존값에 같은 음료 추가 불가능.
            self.stock[productType]?.append(beverage)
        } else {
            self.stock[productType] = Products(beverages: [beverage])
        }
    }
    
    // 구매가능한 [음료종류:재고]로 반환
    func readBuyableProducts(price: Int) -> [ProductType:Int] {
        let buyableStock = self.stock.filter { $0.key.price <= price }
        return buyableStock.mapValues { $0.count }
    }
    
    mutating func buy(_ productType: ProductType) -> Beverage? {
        return self.stock[productType]?.remove()
    }
}

struct Products: Equatable, Sequence {
    
    private var beverages: [Beverage]
    
    var count: Int {
        return self.beverages.count
    }
    
    init(beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    mutating func append(_ beverage: Beverage) {
        self.beverages.append(beverage)
    }
    
    mutating func remove() -> Beverage? {
        return self.beverages.popLast()
    }
}

extension Products: IteratorProtocol {
    typealias Element = Beverage
    
    mutating func next() -> Element? {
        return beverages.popLast()
    }
}
