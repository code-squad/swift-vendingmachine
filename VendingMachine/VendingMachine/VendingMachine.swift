//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    typealias Balance = Int
    typealias Stock = Int
    typealias Purchased = Int
    static let sharedMachine = VendingMachine()
    private init() {
        self.inventory = []
    }
    // 자판기에 있는 음료수 인스턴스 리스트. 중복가능.
    var inventory: [Beverage]
    // 재고 리스트 반환.
    var inventoryHistory: [Menu:Stock]? {
        // 자판기의 음료수 리스트를 Counter가 받아서 종류별로 재고 카운트.
        return [:]
    }

    // 선택 가능한 메뉴.
    enum Menu: String, CustomStringConvertible {
        case strawberryMilk = "날마다딸기우유"
        case bananaMilk = "날마다바나나우유"
        case chocoMilk = "날마다초코우유"
        case coke = "다이어트 코카콜라"
        case cider = "칠성사이다"
        case fanta = "환타오렌지"
        case top = "티오피"
        case cantata = "칸타타"
        case georgia = "조지아"
        var description: String {
            return self.rawValue
        }
    }

    // 삽입 가능한 돈 단위.
    enum MoneyUnit: Int, CustomStringConvertible {
        case oneHundred = 100
        case fiveHundred = 500
        case oneThousand = 1000
        var description: String {
            return String(self.rawValue)
        }
    }

    // 자판기 금액을 원하는 금액만큼 올리는 메소드.
    func insertMoney(_ coin: MoneyUnit) -> Balance {
        return 0
    }

    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드.
    func addToInventory(_ beverageType: Menu, _ addCount: Stock) {
        // 추가하는 메뉴타입의 음료수 객체 생성.
        // 벤딩머신에 담기.
        // 인벤토리 재고 기록.
    }

    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드.
    func showAffordableBeverages() -> [Beverage] {
        return []
    }

    // 음료수를 구매하는 메소드. 해당 음료가 품절인 경우, nil 반환.
    func popBeverage() -> Beverage? {
        return nil
    }

    // 잔액을 확인하는 메소드.
    func showBalance() -> Balance {
        return 0
    }

    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드.
    func checkTheStock() -> [Menu:Stock] {
        return [:]
    }

    // 유통기한이 지난 재고만 리턴하는 메소드.
    func showExpiredBeverages() -> [Menu] {
        return []
    }

    // 따뜻한 음료만 리턴하는 메소드.
    func showHotBeverages() -> [Menu] {
        return []
    }

    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드.
    func showPurchasedList() -> [Menu:Purchased] {
        return [:]
    }

}
