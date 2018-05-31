//
//  Vendingmachine.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Vendingmachine {
    
    private var balance = 0


    //자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func addBalance(_ inputMoney: Int) {
        self.balance += inputMoney
    }
    
    
    //특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    
    
    
    
    //현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    
    
    //음료수를 구매하는 메소드
    
    
    
    //잔액을 확인하는 메소드
    func checkBalance() -> Int {
        return self.balance
    }
    
    //전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    
    
    //유통기한이 지난 재고만 리턴하는 메소드
    
    
    //따뜻한 음료만 리턴하는 메소드
    
    
    //시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    
    
}
