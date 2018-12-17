//
//  Inventory.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Inventory {
    private var list: [ObjectIdentifier: Pack]

    init(list: [ObjectIdentifier: Pack]) {
        self.list = list
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func add(beverage: Beverage) {
        let beverageType = ObjectIdentifier(type(of: beverage))
        if let pack = list[beverageType] {
            pack.add(beverage: beverage)
            return
        }
        list[beverageType] = Pack(beverages: [beverage])
    }

    func getListOfAll() -> [Pack: Int] {
        var listOfAll: [Pack: Int] = [:]
        for pack in list.values {
            listOfAll[pack] = pack.count
        }
        return listOfAll
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func getListBuyable(with money: Int) -> [Pack] {
        return list.values.filter { $0.isBuyable(with: money) }
    }

    private func findID(of pack: Pack) -> ObjectIdentifier? {
        for item in list {
            if item.value == pack { return item.key }
        }
        return nil
    }

    //    음료수를 구매하는 메소드
    func remove(selected pack: Pack) -> Beverage? {
        guard let id = findID(of: pack) else { return nil }
        return list[id]?.removeOne()
    }
    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    //    유통기한이 지난 재고만 리턴하는 메소드
    //    따뜻한 음료만 리턴하는 메소드

}
