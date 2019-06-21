//
//  VendingMachineManagement.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/20/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachineManagement {
    private var stock = [Drink]()
    
    /// 자판기를 초기화하는 메소드
    private func initVendingMachine() -> VendingMachine {
        return VendingMachine(stock: stock)
    }
    
    /// 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    private mutating func supply(_ product: Drink, amount: Int) {
        for _ in 1...amount {
            stock.append(product)
        }
    }
    
    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    private func getStockList () -> Dictionary<Drink, Int> {
        var stockList = Dictionary<Drink, Int>()
        
        for drink in stock {
            let stockCount = getStockCount(drink, stockList)
            stockList[drink] = stockCount
        }
        
        return stockList
    }
    
    private func getStockCount (_ drink: Drink, _ stockList: Dictionary<Drink, Int>) -> Int {
        if let stockCount = stockList[drink] {
            return stockCount + 1
        }
        
        return 1
    }
    
    /// 유통기한이 지난 재고만 리턴하는 메소드
    private func getExpiredDrinkList () -> [Drink] {
        var expiredDrinks = stock.filter() { (drink: Drink) -> Bool in
            return !drink.validate()
        }
        
        expiredDrinks.removeDuplicates()
        
        return expiredDrinks
    }
    
    /// 따뜻한 음료만 리턴하는 메소드
    private func getHotDrinkList () -> [Drink] {
        var hotDrinks = stock.filter() { (drink: Drink) -> Bool in
            let coffee = drink as! Coffee
            return coffee.isHot()
        }
        
        hotDrinks.removeDuplicates()
        
        return hotDrinks
    }
    
    /// 메뉴를 실행하는 메소드
    func executeMenu (_menu: ManagementMenu) {
        
    }
    
    /// 메뉴를 리턴하는 메소드
    func getMenu () -> Dictionary<Int, String> {
        var menu = Dictionary<Int, String>()
        
        for managementMenu in ManagementMenu.allCases {
            menu[managementMenu.rawValue] = managementMenu.localizedDescription
        }
        
        return menu
    }
}

