//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var money: Int
    
    init(startMoney: Int = 0) {
        self.money = startMoney
    }
    
    mutating func addMoney(money: Int) -> Bool {
        guard money > 0 else { return false }
        self.money += money
        return true
    }
}


/*
 0 : 자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
 
 자판기 금액을 원하는 금액만큼 올리는 메소드
 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
 음료수를 구매하는 메소드
 잔액을 확인하는 메소드
 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
 유통기한이 지난 재고만 리턴하는 메소드
 따뜻한 음료만 리턴하는 메소드
 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
 main에서 음료수 객체 인스턴스를 종류별로 추가하고 자판기 동작을 확인하도록 구현한다.
 자판기 화면을 자기만의 방식으로 메뉴를 표시한다.
 메뉴에서 입력하는 동작을 자판기 함수에 연결한다.
 전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.
 예를 들어서, 재고 몇 개 추가하고 잔액 얼마 추가하면 어떤 상품 구매가능, 불가능인지 확인하고 가능한 상품 구매하고, 잔액 바뀌고 재고 상태 바뀌고, 구매 상품 이력을 확인한다.
 
 */

