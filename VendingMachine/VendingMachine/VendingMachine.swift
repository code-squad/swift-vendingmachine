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
    private var count: Int { return beverage.count }
    private var currentBalance: Int
    
    init(currentBalance: Int = 0) {
        self.currentBalance = currentBalance
    }
    
    // 현재 보유 중인 음료 리턴
    func drinks() -> [Beverage] {
        return self.beverage
    }
    
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func insert(money: String) {
        let won = Int(money.dropFirst(2))!
        self.currentBalance = currentBalance + won
    }
    
    // 현재 잔액 리턴
    func balance() -> Int {
        return self.currentBalance
    }

    //특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    // 인스턴스가 생성될 때마다 재고가 쌓이도록 하는것
    // 재고는 음료별 수량을 확인하는 것
    // beverage 배열을 이용해서 [음료명:재고] 형식의 딕셔너리를 만들어줌
    mutating func fill() {
        for drinks in beverage {
            let name = drinks.beverageName
            //self.inventory[name] = count
        }
    }
   
    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    
    
     // 음료수를 구매하는 메소드
    
    
//     잔액을 확인하는 메소드
//     전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
//     유통기한이 지난 재고만 리턴하는 메소드
//     따뜻한 음료만 리턴하는 메소드
//     시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    
}






