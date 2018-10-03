//
//  OutputView.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CommonPrintable {
    static func printInventoryList(with beverages: [[Beverage]]?) throws
}

protocol UserPrintable: CommonPrintable {
    static func printPresentBalance(with balance: Int)
    static func printSelectMenu()
    static func printPurchase(with beverage: Beverage)
    static func printHistory(with beverages: [Beverage])

}

protocol AdminPrintable: CommonPrintable {
    static func printSelectMenuAdmin()
    static func printAppendableBeverages()
    static func printAddedBeverages(with beverages: [Beverage])
    static func printRemovedBeverages(with beverages: [Beverage])
    static func printExpiredBeverages(with beverages: [[Beverage: Int]])
    static func printRemoveExpiredBeverages(with beverages: [Beverage])
}

protocol MainPrintable {
    static func printError(with error: Errorable)
    static func printSelectMode()
}

struct OutputView: UserPrintable, AdminPrintable, MainPrintable {
    public static func printInventoryList(with beverages: [[Beverage]]?) throws {
        guard let beverage = beverages else { throw MachineError.outOfStock }
        var result = ""
        for index in 0..<beverage.count {
            result += ("\(index+1)) \(beverage[index][0].description) (\(beverage[index].count)개)\n")
        }
        print("다음과 같은 음료가 있습니다.")
        print(result)
    }

    public static func printPresentBalance(with balance: Int) {
        print("현재 투입한 금액이 \(balance)원 입니다.")
    }

    public static func printSelectMenu() {
        print(Menu.allCases.map({"\($0.rawValue + 1). \($0.description)"}).joined(separator: "\n"))
    }

    public static func printPurchase(with beverage: Beverage) {
        print("\(beverage.beverageName())를 구매하셨습니다. \(beverage.beveragePrice())원을 차감합니다.")
    }

    public static func printError(with error: Errorable) {
        print(error.description)
    }

    public static func printHistory(with beverages: [Beverage]) {
        print("다음과 같은 구매이력이 있습니다.")
        print(beverages.map({"\($0.description)"}).joined(separator: "\n"))
    }

    public static func printSelectMode() {
        print("자판기를 시작합니다.")
        print(Mode.allCases.map({"\($0.rawValue + 1). \($0.description)"}).joined(separator: "\n"))
    }

    public static func printSelectMenuAdmin() {
        print("원하는 작업을 선택해주세요.")
        print(MenuAdmin.allCases.map({"\($0.rawValue + 1). \($0.description)"}).joined(separator: "\n"))
    }

    public static func printAppendableBeverages() {
        print("추가 할 음료를 선택해주세요.")
        print(Product.allCases.map({"\($0.rawValue + 1)) \($0.description)"}).joined(separator: "\n"))
    }

    public static func printAddedBeverages(with beverages: [Beverage]) {
        print("\(beverages[0].beverageName()) 음료가 \(beverages.count)개 추가되었습니다.")
    }

    public static func printRemovedBeverages(with beverages: [Beverage]) {
        print("\(beverages[0].beverageName()) 음료가 \(beverages.count)개 제거되었습니다.")
    }

    public static func printExpiredBeverages(with beverages: [[Beverage: Int]]) {
        var result = ""
        for index in 0..<beverages.count {
            result += ("\(index+1)) \(beverages[index].map({ $0.key.beverageName() })[0]) (\(beverages[index].count)개)\n")
        }
        print("유통기한(14일)이 지난 음료 리스트입니다. 삭제하시겠습니까?")
        print(result)
        print("1. 삭제하기")
        print("2. 종료하기")
    }

    public static func printRemoveExpiredBeverages(with beverages: [Beverage]) {
        print("아래 음료 목록이 제거되었습니다.")
        for beverage in beverages {
            print("\(beverage.beverageName()) 음료가 제거되었습니다.")
        }
    }
}
