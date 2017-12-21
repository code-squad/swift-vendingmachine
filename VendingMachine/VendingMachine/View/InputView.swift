//
//  InputView.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class InputView {
    // 모드 메뉴 종류.
    enum Menu: Int, CustomStringConvertible, EnumCollection {
        case adminMode = 1
        case userMode
        var description: String {
            var menuName = ""
            switch self {
            case .adminMode: menuName = "관리자 모드"
            case .userMode: menuName = "사용자 모드"
            }
            return String(rawValue) + ". " + menuName
        }
    }

    private static func showScreen() -> String {
        var screen = "자판기를 시작합니다.\n"
        for menu in Menu.allValues {
            screen += menu.description + "\n"
        }
        screen += "> "
        return screen
    }

    static func prompt<MachineType: Managable&UserServable>(_ machine: MachineType) -> ActivateMode? {
        print(showScreen(), terminator: "")
        guard let userInput = readLine(), let userMenuNumber = Int(userInput) else { return nil }
        guard let inputMode = Menu(rawValue: userMenuNumber) else { return nil }
        switch inputMode {
        case .adminMode: return AdminMode(machine)
        case .userMode: return UserMode(machine)
        }
    }
    
}
