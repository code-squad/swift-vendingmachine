//
//  StockController.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct StockController {

    private(set) var inventory = [ObjectIdentifier: [Beverage]]()
    private var history = History()
    private(set) var shelf = Shelf()

    init (items: [Beverage]) {
        items.forEach{ item in self.history.addSupplyLog(item)}
        let stockSets = items.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        self.inventory = stockSets
        self.shelf = Shelf(items: self.inventory)
    }

    func setAsDictionary (_ beverages: [Beverage]) -> [ObjectIdentifier: [Beverage]] {
        let stockSets = beverages.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
    return stockSets
    }

    mutating func buy(itemCode: Int, balance: Int) throws -> Beverage {
        let key = try shelf.matchCode(option: itemCode)
        let item = self.inventory[key]![0]
        history.addPurchaseLog(item)
        self.shelf = shelf.update(newItems: self.inventory)
        return item
    }

    // remove한 뒤에 리턴해버리니까 음료수가 한개만 남은상태에서
    // 구매하려고하면 range에러뜨는 상황 발생해서 두 메소드로 나눔
    mutating func removeItem(_ itemCode: Int) throws {
        let key = try shelf.matchCode(option: itemCode)
        self.inventory[key]!.remove(at: 0)
        self.shelf = shelf.update(newItems: self.inventory)
    }

    mutating func addItem(item: Beverage) {
        for set in self.inventory {
            if var arr = self.inventory[ObjectIdentifier(type(of:item))] {
                arr.append(item)
                self.inventory[ObjectIdentifier(type(of:item))] = arr
                break
            } else if set.key != ObjectIdentifier(type(of:item)) {
                let newItemSet = [ObjectIdentifier(type(of:item)) : [item]]
                self.inventory = self.inventory.update(other: newItemSet)
            }
        }
        self.history.addSupplyLog(item)
        self.shelf = shelf.update(newItems: self.inventory)
    }


    func priceOfItem(_ itemCode: Int) throws -> Int {
        let key = try self.shelf.matchCode(option: itemCode)
        return self.inventory[key]![0].price()
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

    func menu() -> String {
        var result = ""
        var index = 0
        let itemCodes = self.shelf.itemTags

        for itemCode in itemCodes where self.inventory[itemCode]!.count > 0 {
            let item = self.inventory[itemCode]![0]
            index += 1
            result += "\(index)) \(item.type) : \(item.price())원 | \(self.inventory[itemCode]!.count)개 \n"
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

    func finditemsCheaper(than balance: Money) -> [ObjectIdentifier: [Beverage]] {
        var valid = [Beverage]()
        for set in self.inventory {
            for product in set.value {
                if balance.isAffordable(item: product) {
                    valid.append(product)
                }
            }
        }
         return self.setAsDictionary(valid)
    }

    func showHistory() -> String {
        return self.history.log()
    }

    // 가장 저렴한 금액의 음료 가격 리턴
    func cheapestPrice() -> Int {
        var price = [Int]()
        for set in self.inventory {
            for product in set.value {
                price.append(product.price())
            }
        }
        let cheapest = price.sorted()[0]
        return cheapest
    }


}
