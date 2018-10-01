//
//  OutputView.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
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
    
    public static func printPurchase(with beverage : Beverage) {
        print("\(beverage.beverageName())를 구매하셨습니다. \(beverage.beveragePrice())원을 차감합니다.")
    }
    
    public static func printError(with error : Errorable) {
        print(error.description)
    }
    
    public static func printHistory(with beverages : [Beverage]) {
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
    
    public static func printAddedBeverages(with beverages : [Beverage]) {
        print("\(beverages[0].beverageName()) 음료가 \(beverages.count)개 추가되었습니다.")
    }
    
    public static func printRemovedBeverages(with beverages : [Beverage]) {
        print("\(beverages[0].beverageName()) 음료가 \(beverages.count)개 제거되었습니다.")
    }
}
