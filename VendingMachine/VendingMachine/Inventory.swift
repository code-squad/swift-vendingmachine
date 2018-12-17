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
            if pack.isEmpty() { continue }
            listOfAll[pack] = pack.count
        }
        return listOfAll
    }

    func getListBuyable(with money: Int) -> [Pack] {
        return list.values.filter { $0.isBuyable(with: money) }
    }

    private func findID(of pack: Pack) -> ObjectIdentifier? {
        for item in list {
            if item.value == pack { return item.key }
        }
        return nil
    }

    func remove(selected pack: Pack) -> Beverage? {
        guard let id = findID(of: pack) else { return nil }
        return list[id]?.removeOne()
    }

    func isEmpty() -> Bool {
        for item in list {
            guard item.value.isEmpty() else { return false }
        }
        return true
    }

}
