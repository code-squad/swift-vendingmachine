//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias Stock = Int
typealias Balance = Int

class VendingMachine: Sequence {
    typealias Purchased = Int
    static let sharedMachine = VendingMachine()
    private var stockManager: StockManager
    private var moneyManager: MoneyManager
    private init() {
        self.inventory = []
        self.stockManager = StockManager()
        self.moneyManager = MoneyManager()
    }
    let start = 0
    // 자판기에 있는 음료수 인스턴스 리스트. 중복가능.
    private var inventory: [Beverage]

    func makeIterator() -> ClassIteratorOf<Beverage> {
        return ClassIteratorOf(self.inventory)
    }

    // 특정상품의 재고를 N개 채우는 함수.
    func supply(beverageType: VendingMachine.Menu, _ addCount: Stock) {
        for _ in 0..<addCount {
            // 인벤토리에 추가.
            self.inventory.append(beverageType.generate())
            // 재고 기록 업데이트.
            self.stockManager.record(for: beverageType)
        }
    }

    // 선택 가능한 메뉴.
    enum Menu: String, CustomStringConvertible {
        case strawberryMilk
        case bananaMilk
        case chocoMilk
        case coke
        case cider
        case fanta
        case top
        case cantata
        case georgia

        // Menu 열거형과 클래스들을 이어주는 역할.
        var description: String {
            // 각 메뉴의 Beverage 클래스명 반환.
            return String.init(describing: type(of: self.generate()))
        }

        // 각 메뉴별 Beverage 인스턴스 생성.
        func generate() -> Beverage {
            var beverage = Beverage()
            switch self {
            case .strawberryMilk: beverage = StrawBerryMilk("서울우유", 200, 1000, "날마다딸기우유", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*7), 210, manufacturerCode: 1001, packingMaterial: "종이")
            case .bananaMilk: beverage = BananaMilk("서울우유", 200, 1000, "날마다바나나우유", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*7), 220, manufacturerCode: 1001, packingMaterial: "종이")
            case .chocoMilk: beverage = ChocoMilk("서울우유", 200, 1000, "날마다초코우유", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*7), 240, manufacturerCode: 1001, packingMaterial: "종이")
            case .coke: beverage = CokeSoftDrink("펩시", 350, 2000, "다이어트콜라", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*30*6), 250, carbonContent: 50)
            case .cider: beverage = CiderSoftDrink("롯데칠성음료", 350, 2000, "사이다", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*30*6), 250, carbonContent: 60)
            case .fanta: beverage = FantaSoftDrink("코카콜라컴퍼니", 350, 2000, "환타", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*30*7), 300, carbonContent: 40)
            case .top: beverage = TopCoffee("맥심", 200, 2200, "티오피", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*14), 240, caffeineLevels: 20, isHot: false, isSweetened: true)
            case .cantata: beverage = CantataCoffee("롯데칠성음료", 200, 2200, "칸타타", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*14), 250, caffeineLevels: 10, isHot: false, isSweetened: true)
            case .georgia: beverage = GeorgiaCoffee("코카콜라", 200, 2200, "조지아커피", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*2), 100, caffeineLevels: 25, isHot: true, isSweetened: false)
            }
            return beverage
        }
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
