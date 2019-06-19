//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var balance: Int
    private var stock: [Drink]
    private var sellList = [Drink]()
    
    /// 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func insertCoint(_ coin: Int) {
        balance += coin
    }
    
    /// 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    mutating func supply(_ product: Drink) {
        stock.append(product)
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func getBuyableDrinkList () -> [Drink] {
        let buyableDrinks = stock.filter({ (drink: Drink) -> Bool in
            return drink.isBuyable(money: balance)
        })
        
        return buyableDrinks
    }
    
    /// 음료수를 구매하는 메소드
    mutating func buy (_ drink: Drink) throws {
        let drinkIndex = stock.firstIndex(of: drink)
        
        guard let buyDrinkIndex = drinkIndex else {
            throw BuyError.NonStock
        }
    
        guard stock[buyDrinkIndex].isBuyable(money: balance) else {
            throw BuyError.NotenoughBalance
        }
        
        sellList.append(drink)
        stock.remove(at: buyDrinkIndex)
    }
    
    /// 잔액을 확인하는 메소드
    func getBalance () -> Int {
        return balance
    }
    
    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getStockList () throws -> Dictionary<Drink, Int> {
        var stockList = Dictionary<Drink, Int>()
        
        for drink in stock {
            var sameDrinkCount = 0
            try stock.drop(while: {(drinkRooped :Drink) throws -> Bool in
                sameDrinkCount += 1
                return drink == drinkRooped
            })
            
            stockList[drink] = sameDrinkCount
        }
        
        return stockList
    }
    
    /// 유통기한이 지난 재고만 리턴하는 메소드
    func getExpiredDrinkList () -> [Drink] {
        let expiredDrinks = stock.filter({ (drink: Drink) -> Bool in
            return drink.validate()
        })
        
        return expiredDrinks
    }
    
    /// 따뜻한 음료만 리턴하는 메소드
    func getHotDrinkList () -> [Drink] {
        let hotDrinks = stock.filter({ (drink: Drink) -> Bool in
            let coffee = drink as! Coffee
            return coffee.isHot()
        })
        
        return hotDrinks
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func getSellList () -> [Drink] {
        return sellList
    }
}
