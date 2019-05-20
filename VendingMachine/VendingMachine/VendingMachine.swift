//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 김지나 on 22/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var beverage: [Beverage] {
        return [Strawberry(strawberryContent: 3, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "딸기우유"),
                Chocolate(chocolateContent: 30, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "초코우유"),
                Cola(calorie: 200, brand: Cola.company.cocacola, volume: 400, price: 2000, productName: "코카콜라"),
                Sider(carbonicAcidContent: 30, calorie: 300, brand: "코카콜라", volume: 300, price: 2000, productName: "스프라이트"),
                Kanu(kindOfKanu: "아이스블랜드", ice: true, brand: "맥심", volume: 180, price: 500, productName: "카누 아이스 블랜드"),
                TOP(flavor: "라떼", ice: false, brand: "맥심", volume: 200, price: 1400, productName: "TOP카페라떼")]
    }
    private var currentBalance: Int
    private var currentBeverage = [Int:(String,Int,Int)]()
    private var purchase = [String]()
    
    init(currentBalance: Int = 0) {
        self.currentBalance = currentBalance
    }
    
    // 현재 보유 중인 음료 리턴
    func drinks() -> [Beverage] {
        return self.beverage
    }
    
    // 자판기 금액을 변경해주는 메소드
    mutating func insert(money: String) {
        let won = Int(money.dropFirst(2))!
        self.currentBalance = currentBalance + won
    }
    
    // 현재 잔액 리턴
    func balance() -> Int {
        return self.currentBalance
    }
    

    /// 음료 내역
    // beverage 배열을 이용해서 [종류개수:(음료명,가격,재고)] 형식의 재고상태를 보여주는 딕셔너리를 만듦
    mutating func inventory() {
        for drinks in 0 ..< beverage.count {
            self.currentBeverage.updateValue((beverage[drinks].beverageName,beverage[drinks].beveragePrice,10), forKey: drinks)
        }
    }
    // 현재 음료 현황 리턴
    func currentBeverageStatus() -> [Int:(String,Int,Int)] {
        return currentBeverage
    }
    
    
    /// 음료수 구매
    // 구매한 음료 처리
    mutating func sell(beverage: String) {
        let selectBeverageNum = Int(beverage.dropFirst(2))! - 1
        for inner in currentBeverage {
            if inner.key == selectBeverageNum {
                subtract(from: inner.key)
                purchaseList(from: inner.key)
                deduct(money: inner.key)
                OutputView().printPurchase(productName: currentBeverage[inner.key]!.0, price: currentBeverage[inner.key]!.1)
            }
        }
    }
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    private mutating func purchaseList(from productNumber: Int) {
        self.purchase.append(currentBeverage[productNumber]!.0)
    }

    // 재고 마이너스
    private mutating func subtract(from inventory: Int) {
        self.currentBeverage[inventory]!.2 -= 1
    }
    
    // 잔액 마이너스
    private mutating func deduct(money: Int) {
        self.currentBalance = currentBalance - currentBeverage[money]!.1
    }
    
    
    /// 특정 음료 구분
    // 유통기한이 지난 재고만 리턴하는 메소드
    private func notValidDate() -> [String] {
        var pastExpiration = [String]()
        for date in beverage{
            if date.validate() == false {
                pastExpiration.append(date.beverageName)
            }
        }
        return pastExpiration
    }

    // 따뜻한 음료만 리턴하는 메소드
    private func hotBeverage() -> [String] {
        var hot = [String]()
        for drinks in beverage {
            guard let coffee = drinks as? Coffee else {return [""]}
            if coffee.isHot() == true {
                hot.append(drinks.beverageName)
            }
        }
        return hot
    }
}
