//
//  InputView.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CommonWritable {
    static func readInput() -> String?
    static func isEmpty(to value:String?) -> String?
}

protocol UserWritable {
    static func selectMenuType() throws -> (Menu , Int)
}

protocol AdminWritable {
    static func selectMenuTypeAdmin() throws -> MenuAdmin
    static func selectAddBeverage() throws -> (Int , Int)
    static func isRemoveExpiredBeverages() throws -> Bool
}

protocol MainWritable {
    static func selectModeType() throws -> Mode
}

struct InputView {
    public static func selectMenuType() throws -> (Menu , Int) {
        guard let input = InputView.readInput() else { throw InputError.empty }
        let elements = input.components(separatedBy: " ")
        guard let type = Int(elements[0]) else { throw InputError.incorrect }
        var value = 0
        if elements.count == 2 {
            guard let element = Int(elements[1]) else { throw InputError.incorrect }
            value = element
        }
        let menuType = try Menu.select(with: type)
        return (menuType , value)
    }
    
    // 입력값 받는 함수
    public static func readInput() -> String? {
        guard let input = InputView.isEmpty(to: readLine()) else { return nil }
        return input
    }
    
    // 입력값 비어 있는지 확인하는 함수
    public static func isEmpty(to value:String?) -> String? {
        guard let inputValue = value else { return nil }
        if inputValue.isEmpty { return nil }
        return inputValue
    }
    
    public static func selectModeType() throws -> Mode {
        guard let input = InputView.readInput() else { throw InputError.empty }
        guard let type = Int(input) else { throw InputError.incorrect }
        let modeType = try Mode.select(with: type)
        return modeType
    }
    
    public static func selectMenuTypeAdmin() throws -> MenuAdmin {
        guard let input = InputView.readInput() else { throw InputError.empty }
        guard let type = Int(input) else { throw InputError.incorrect }
        let menuType = try MenuAdmin.select(with: type)
        return menuType
    }
    
    public static func selectAddBeverage() throws -> (Int , Int) {
        guard let input = InputView.readInput() else { throw InputError.empty }
        let elements = input.components(separatedBy: " ")
        guard elements.count == 2 else { throw InputError.incorrect }
        
        guard let target = Int(elements[0]) else { throw InputError.incorrect }
        var amount = 1
        if elements.count == 2 {
            guard let element = Int(elements[1]) else { throw InputError.incorrect }
            amount = element
        }
        return (target , amount)
    }
    
    public static func isRemoveExpiredBeverages() throws -> Bool {
        guard let input = InputView.readInput() else { throw InputError.empty }
        guard let select = Int(input) else { throw InputError.incorrect }
        guard select == 1 || select == 2 else { throw InputError.rangeExceed }
        return select == 1 ? true : false
    }
}
