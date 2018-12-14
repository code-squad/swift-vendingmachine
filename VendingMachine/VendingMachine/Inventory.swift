//
//  Inventory.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Inventory {
    private var beverages: [Beverage]

    init() {
        self.beverages = []
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func add(_ beverage: Beverage) {
        beverages.append(beverage)
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func countNumberOfEachBeverage() -> [Beverage: Int] {
        var numberOfEachBeverage: [Beverage: Int] = [:]
        for beverage in beverages {
            numberOfEachBeverage[beverage] = numberOfEachBeverage[beverage] ?? 0 + 1
        }
        return numberOfEachBeverage
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func getListOfBuyable(for cash: Int) -> [Beverage] {
        var beveragesBuyable: [Beverage] = []
        for beverage in beverages {
            guard beverage.isBuyable(for: cash) else { continue }
            beveragesBuyable.append(beverage)
        }
        return beveragesBuyable
    }

}
