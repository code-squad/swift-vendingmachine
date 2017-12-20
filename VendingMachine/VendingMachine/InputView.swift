//
//  InputView.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct InputView {
    // 자판기 모드를 선택한다.
    static func readMode() throws -> ModeSelector {
        print("###자판기를 실행### > 안녕하세요?, 모드를 선택해주세요.")
        print("1. 관리자모드")
        print("2. 사용자모드")
        guard let selectedMenu = readLine() else { throw ErrorCode.validInputString }
        guard selectedMenu != "q" else { throw ErrorCode.endCode }
        guard let convertMenu = Int(selectedMenu) else { throw ErrorCode.invalidMenu }
        if convertMenu == ModeSelector.adminMode.rawValue {
            return ModeSelector.adminMode
        } else if convertMenu == ModeSelector.userMode.rawValue {
            return ModeSelector.userMode
        }
        throw ErrorCode.invalidMenu
    }
    static func readUserMenu() throws -> [Int] {
        print("1. 금액추가")
        print("2. 음료구매")
        guard let selectedMenu = readLine() else {
            throw ErrorCode.validInputString
        }
        guard selectedMenu != "q" else {
            throw ErrorCode.endCode
        }
        return try separateMenu(selectedMenu)
    }
    private static func separateMenu(_ value: String) throws -> [Int] {
        let menuAndValue = value.split(separator: " ").flatMap { Int($0) }
        guard !menuAndValue.isEmpty else {
            throw ErrorCode.invalidMenu
        }
        return menuAndValue
    }
    static func readAdminMenu() throws -> MenuSelectorAdmin {
        print("###관리자모드### > 실행하실것을 선택해주세요.")
        print("1. 재고추가")
        print("2. 재고삭제")
        guard let selectedMenu = readLine() else { throw ErrorCode.validInputString }
        guard selectedMenu != "q" else { throw ErrorCode.endCode }
        guard let convertMenu = Int(selectedMenu) else { throw ErrorCode.invalidMenu }
        if convertMenu == MenuSelectorAdmin.addstock.rawValue {
            return MenuSelectorAdmin.addstock
        } else if convertMenu == MenuSelectorAdmin.removeStock.rawValue {
            return MenuSelectorAdmin.removeStock
        }
        throw ErrorCode.invalidMenu
    }
    static func readSelectedBeverage() throws -> Int {
        guard let beverage = readLine() else {
            throw ErrorCode.validInputString
        }
        guard let convertBeverage = Int(beverage) else {
            throw ErrorCode.invalidMenu
        }
        return convertBeverage
    }
}
