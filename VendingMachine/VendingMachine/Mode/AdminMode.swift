//
//  AdminMode.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class AdminMode<MachineType: Managable>: ActivateMode {
    typealias ModesType = Modes
    private let machine: MachineType
    init(_ machine: MachineType) {
        self.machine = machine
    }

    // 사용자 메뉴 종류.
    enum Modes: Int, CustomStringConvertible, EnumCollection {
        case supplyAll = 1
        case supplyEach
        case remove
        case checkPurchasedList
        case restart
        var description: String {
            var menuName = ""
            switch self {
            case .supplyAll: menuName = "상품일괄추가 (예: 1 10)"
            case .supplyEach: menuName = "상품추가 (예: 2 5(상품번호) 10)"
            case .remove: menuName = "상품제거 (예: 3 5(상품번호) 5)"
            case .checkPurchasedList: menuName = "구매이력조회"
            case .restart: menuName = "모드재선택"
            }
            return String(rawValue) + ". " + menuName
        }
    }

    // 사용자 스크린 표시 및 사용자 입력값(1개 이상) 전처리 및 반환.
    func prompt() -> [Argument]? {
        print(showScreen(), terminator: "")
        let inputArguments = splitUserInput()
        guard inputArguments.count > 0 else { return nil }
        return inputArguments
    }

    func perform(_ arguments: [Argument]) -> String? {
        guard let preprocessed = preprocessArguments(using: arguments) else { return nil }
        var result: String?
        switch preprocessed.mode {
        case .supplyAll: result = performSupplyAll(preprocessed.leftArgs)
        case .supplyEach: result = performSupplyEach(preprocessed.leftArgs)
        case .remove: result = performRemove(preprocessed.leftArgs)
        case .checkPurchasedList: result = performCheckPurchasedList()
        case .restart: return nil
        }
        return result
    }
}

private extension AdminMode {
    // 입력받은 인자 중에서 첫 번째 인자를 Modes 타입으로 변환.
    func preprocessArguments(using userInputs: [Argument]) -> (mode: Modes, leftArgs: [Argument])? {
        var userInputs = userInputs
        // 첫번째 인자를 Modes 타입 메뉴로 변환.
        guard let firstArg = userInputs.first, let userMode = Modes(rawValue: firstArg) else { return nil }
        userInputs.removeFirst()
        return (userMode, userInputs)
    }

    func performSupplyAll(_ arguments: [Argument]) -> String? {
        guard let supplyCount = arguments.first else { return nil }
        machine.fullSupply(supplyCount)
        return "\n모든 상품의 재고가 \(supplyCount)개씩 추가되었습니다."
    }

    func performSupplyEach(_ arguments: [Argument]) -> String? {
        guard let firstArg = arguments.first, let firstIndex = arguments.index(of: firstArg) else { return nil }
        guard 0 < firstArg && firstArg <= MachineType.MenuType.allValues.count else { return nil }
        let supplyMenu = MachineType.MenuType.allValues[firstArg-1]
        let supplyCount = arguments[arguments.index(after: firstIndex)]
        machine.supply(productType: supplyMenu, supplyCount)
        return "\n\(supplyMenu) 상품의 재고가 \(supplyCount)개 추가되었습니다."
    }

    func performRemove(_ arguments: [Argument]) -> String? {
        guard let firstArg = arguments.first, let firstIndex = arguments.index(of: firstArg) else { return nil }
        guard 0 < firstArg && firstArg <= MachineType.MenuType.allValues.count else { return nil }
        let removeMenu = MachineType.MenuType.allValues[firstArg-1]
        let removeCount = arguments[arguments.index(after: firstIndex)]
        machine.remove(productType: removeMenu, removeCount)
        return "\n\(removeMenu) 상품의 재고가 \(removeCount)개 제거되었습니다."
    }

    func performCheckPurchasedList() -> String? {
        var screen = "\n=====================구매이력====================="
        for purchased in machine.showPurchasedList() {
            screen += "\n\(purchased.purchasingDate) | \(purchased.purchasedMenu) | \(purchased.count)"
        }
        return screen
    }

    // 사용자 스크린 표시.
    func showScreen() -> String {
        var screen = "\n===============================================\n"
        screen += "현재 자판기에 있는 음료수는 아래와 같습니다.\n "
        screen += showStockInOrder()
        for inputMenu in Modes.allValues {
            screen += "\n\(inputMenu.description)"
        }
        screen += "\n> "
        return screen
    }

    // 모든 메뉴의 재고가 0개인 경우 true 반환.
    func isStockEmpty(_ stock: [MachineType.MenuType:Stock]) -> Bool {
        let totalStockCount = machine.checkTheStock().values.reduce(0, +)
        return (totalStockCount == 0)
    }

    // 잔액에 따라 메뉴 포맷 달라짐.
    func showStockInOrder() -> String {
        var screen = "\n"
        let stock = machine.checkTheStock()
        if isStockEmpty(stock) {
            screen += "(재고없음)\n"
        }else {
            for menu in MachineType.MenuType.allValues {
                // 현재 메뉴의 재고.
                guard let stock = stock.filter({ $0.key == menu })[menu] else { break }
                // 현재 메뉴의 번호, 이름, 가격, 재고 표시.
                screen += "\(menu.hashValue+1)) \(menu.productName): \(stock)개\n"
            }
        }
        return screen
    }

}
