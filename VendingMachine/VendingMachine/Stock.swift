//
//  Stock.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Stock: CustomStringConvertible {
    private(set) var inventory = [ObjectIdentifier: [Beverage]]()
    private var historyLog = (purchase: [Beverage](),
                              supply: [Beverage]())

    var description: String {
        var result = ""
        self.inventory.forEach { shelf in
            result += "\(shelf.value[0].type) | \(shelf.value[0].getPrice()) : \(shelf.value.count)개 \n"
        }
        return result
    }

    init (items: [Beverage]) {
        self.historyLog.supply += items // 초기화하면서 음료가 in stock되니까 추가
        let stockSets = items.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        self.inventory = stockSets
    }

    func setAsDictionary (_ beverages: [Beverage]) -> [ObjectIdentifier: [Beverage]] {
        let stockSets = beverages.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
    return stockSets
    }

    mutating func buy(item: ObjectIdentifier, balance: Int) throws -> Beverage {
        var hasItem = false
        for set in self.inventory {
            if set.key == item {
                hasItem = true
                break
            }
        }
        if hasItem {
            guard self.inventory[item]![0].isCheaper(than: balance) else {
                throw VendingMachine.Exception.NotEnoughBalance
            }
            historyLog.purchase.append(self.inventory[item]![0])
            return self.inventory[item]![0]
        }
        throw VendingMachine.Exception.OutOfStock
    }

    // remove한 뒤에 리턴해버리니까 음료수가 한개만 남은상태에서
    // 구매하려고하면 range에러뜨는 상황 발생해서 두 메소드로 나눔
    mutating func removeItem(_ item: ObjectIdentifier) {
        self.inventory[item]!.remove(at: 0)
    }

    mutating func addItem(item: Beverage) {
        for set in self.inventory {
            if var arr = self.inventory[ObjectIdentifier(type(of:item))] {
                arr.append(item)
                self.inventory[ObjectIdentifier(type(of:item))] = arr
                break
            } else if set.key != ObjectIdentifier(type(of:item)) {
                let newItemSet = [ObjectIdentifier(type(of:item)) : [item]]
                self.inventory.update(other: newItemSet)
            }
        }
    }

    func priceOfItem(_ itemCode: ObjectIdentifier) -> Int {
        var price = 0
        for set in self.inventory {
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
        for set in self.inventory {
            for item in set.value {
                if item.isHot() {
                    available.append(item)
                }
            }
        }
        return self.setAsDictionary(available)
    }

    func menu(of message: String) -> String {
        var result = "<< \(message) >> \n"

        for set in self.inventory where set.value.count > 0 {
            result += "\(set.value[0].code())) \(set.value[0].type) : \(set.value[0].getPrice())원 | \(set.value.count)개 \n"
        }
        return result
    }

    func stockSummary() -> String {
        var result = ""
        for set in self.inventory where set.value.count > 0 {
            result += "\(set.value[0].type) (\(set.value.count)개) | "
        }
        return result
    }

    // 유통기한 지난 음료
    func findDiscardBeverage() -> [ObjectIdentifier: [Beverage]] {
        var discards = [Beverage]()
        for set in self.inventory {
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
        for set in self.inventory {
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
        for set in self.inventory {
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
