//
//  MenuController.swift
//  VendingMachine
//
//  Created by 윤지영 on 18/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct MenuController {

    static func readMenu(from input: String) throws -> (item: MenuItem, value: Int) {
        let menuSelected = input.split(separator: " ")
        guard menuSelected.count == 2 else { throw MenuError.invalidForm }
        guard let firstMenu = Int(menuSelected[0]) else { throw MenuError.notInt }
        guard let item = MenuItem(rawValue: firstMenu) else { throw MenuError.notSupported }
        guard let value = Int(menuSelected[1]) else { throw MenuError.notInt }
        guard value > 0 else { throw MenuError.notPositiveNumber }
        return (item, value)
    }

}

enum MenuItem: Int, CaseIterable {
    case insertCoin = 1, purchaseBeverage
    
    var message: String{
        switch self {
        case .insertCoin:
            return "금액추가"
        case .purchaseBeverage:
            return "음료구매"
        }
    }
}

enum MenuError: Error, MessagePrintable {
    case invalidForm
    case notInt
    case notSupported
    case notPositiveNumber
    case outOfList

    private var guide: String {
        let example = "ex) 1000원 투입 시 --> 1 1000\n     1번음료 구매 시 --> 2 1"
        switch self {
        case .invalidForm:
            return "메뉴와 값을 띄어 입력해주세요.\n \(example)"
        case .notInt:
            return "메뉴와 값은 숫자로 입력해주세요.\n \(example)"
        case .notSupported:
            return "지원하는 메뉴를 입력해주세요."
        case .notPositiveNumber:
            return "숫자는 양수로 입력해주세요."
        case .outOfList:
            return "입력하신 번호의 음료가 없습니다."
        }
    }

    var message: String {
        return "잘못 입력하셨습니다. \(self.guide)"
    }
}
