//
//  MenuController.swift
//  VendingMachine
//
//  Created by 윤지영 on 18/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct MenuController {

    static func finish(keyword input: String) -> Bool {
        let keywords = ["q", "quit"]
        return keywords.contains(input)
    }

    static func readConsumerMenu(from input: String) throws -> (item: ConsumerMenuItem, value: Int) {
        let menuSelected = input.split(separator: " ")
        guard menuSelected.count == 2 else { throw MenuError.invalidForm }
        guard let firstMenu = Int(menuSelected[0]) else { throw MenuError.notInt }
        guard let item = ConsumerMenuItem(rawValue: firstMenu) else { throw MenuError.notSupported }
        guard let value = Int(menuSelected[1]) else { throw MenuError.notInt }
        guard value > 0 else { throw MenuError.notPositiveNumber }
        return (item, value)
    }

    static func readManagerMenu(from input: String) throws -> ManagerMenuItem {
        guard let menu = Int(input) else { throw MenuError.notInt }
        guard let item = ManagerMenuItem(rawValue: menu) else { throw MenuError.notSupported }
        return item
    }

    static func readMode(from input: String) throws -> ExecutionMode {
        guard let numSelected = Int(input) else { throw MenuError.notInt }
        guard let mode = ExecutionMode(rawValue: numSelected) else { throw MenuError.notSupported }
        return mode
    }

}

enum ExecutionMode: Int, CaseIterable {
    case manager = 1, consumer

    var name: String {
        switch self {
        case .manager:
            return "관리자 모드"
        case .consumer:
            return "사용자 모드"
        }
    }
}

enum ManagerMenuItem: Int, CaseIterable {
    case addBeverage = 1, removeBeverage, removeExpiredBeverages
    case readHistory

    var message: String {
        switch self {
        case .addBeverage:
            return "재고추가"
        case .removeBeverage:
            return "재고삭제"
        case .removeExpiredBeverages:
            return "유통기한만료 재고삭제"
        case .readHistory:
            return "소비자 구매이력 보기"
        }
    }
}

enum ConsumerMenuItem: Int, CaseIterable {
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
        switch self {
        case .invalidForm:
            return "메뉴와 값을 띄어 입력해주세요.\nex) 1000원 투입 시 --> 1 1000\n    1번음료 구매 시 --> 2 1"
        case .notInt:
            return "메뉴와 값은 숫자로 입력해주세요."
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
