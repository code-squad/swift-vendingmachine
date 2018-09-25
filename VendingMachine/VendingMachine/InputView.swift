//
//  InputView.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    static let shared = InputView() // for Singleton
    
    public static var correspondingInputValue:Int? // 메뉴에 해당되는 입력값
    
    public static func selectMenuType() throws -> Menu {
        guard let input = InputView.readInput() else { throw InputError.empty }
        let elements = input.components(separatedBy: " ")
        guard let type = Int(elements[0]) else { throw InputError.incorrect }
        if elements.count == 2 {
            guard let value = Int(elements[1]) else { throw InputError.incorrect }
            self.correspondingInputValue = value
        }
        let menuType = try Menu.select(with: type)
        return menuType
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
}
