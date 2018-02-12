//
//  StockController.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct StockController: CustomStringConvertible {
    private(set) var stock = [ObjectIdentifier: [Beverage]]()
    private var historyLog = (purchase: [Beverage](),
                              supply: [Beverage]())

    var description: String {
        var result = ""
        self.stock.forEach { shelf in
            result += "\(shelf.value[0].type) | \(shelf.value[0].getPrice()) : \(shelf.value.count)개 \n"
        }
        return result
    }

    init (items: [Beverage]) {
        self.historyLog.supply += items // 초기화하면서 음료가 in stock되니까 추가
        let stockSets = items.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        self.stock = stockSets
    }

    func setAsDictionary (_ beverages: [Beverage]) -> [ObjectIdentifier: [Beverage]] {
        let stockSets = beverages.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
    return stockSets
    }

    mutating func removeItem(item: ObjectIdentifier) {
        var hasItem = false
        for set in self.stock {
            if set.key == item {
                hasItem = true
            }
        }
        if hasItem {
            self.stock[item]!.removeLast()
        }
    }

    mutating func addItem(item: Beverage) {
        var tempStock = self.stock
        for var set in tempStock {
            if set.key == ObjectIdentifier(type(of:item)) {
                set.value.append(item)
                historyLog.supply.append(set.value.last!)
            }
            if set.key != ObjectIdentifier(type(of:item)) {
                let newItemSet = [ObjectIdentifier(type(of:item)) : [item]]
                tempStock.update(other: newItemSet)
            }
        }
        self.stock = tempStock
    }

    func priceOfItem(_ itemCode: ObjectIdentifier) -> Int {
        var price = 0
        for set in self.stock {
            if set.key == itemCode {
                price = set.value[0].getPrice()
                break
            } else {
                continue
            }
        }
        return price
    }

    func findHotBeverage() -> [ObjectIdentifier: [Beverage]] {
        var available = [Beverage]()
        for set in self.stock {
            for item in set.value {
                if item.isHot() {
                    available.append(item)
                }
            }
        }
        return self.setAsDictionary(available)
    }

    func stockStatus(of message: String) -> String {
        var result = "<< \(message) >> \n"
        self.stock.forEach { set in
            result += "\(set.value[0].type) : \(set.value[0].getPrice())원 | \(set.value.count)개 \n"
        }
        return result
    }

    func showStock() -> String {
        var result = ""
        self.stock.forEach { set in
            result += "\(set.value[0].type) (\(set.value.count)개) | "
        }
        return result
    }

    // 유통기한 지난 음료
    func findDiscardBeverage() -> [ObjectIdentifier: [Beverage]] {
        var discards = [Beverage]()
        for set in self.stock {
            for product in set.value {
                if !product.isValid() {
                    discards.append(product)
                }
            }
        }
        return self.setAsDictionary(discards)
    }

    // 유통기한 내의 음료
    func findValidBeverage() -> [ObjectIdentifier: [Beverage]] {
        var valid = [Beverage]()
        for set in self.stock {
            for product in set.value {
                if product.isValid() {
                    valid.append(product)
                }
            }
        }
        return self.setAsDictionary(valid)
    }

    func finditemsCheaper(than balance: Int) -> [ObjectIdentifier: [Beverage]] {
        var valid = [Beverage]()
        for set in self.stock {
            for product in set.value {
                if product.getPrice() <= balance {
                    valid.append(product)
                }
            }
        }
         return self.setAsDictionary(valid)
    }

    func makeHistory() -> History {
        return History(historyLog.purchase, historyLog.supply)
    }


}
