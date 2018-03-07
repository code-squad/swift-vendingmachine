//
//  ProgramDescription.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum ProgramDescription: CustomStringConvertible {
    case ChooseMode
    case HasNoItem
    case UnKnown
    case NotEnoughBalance
    case OutOfStock
    case AskInputAgain
    case AdminModeAction
    case QuitVendingMachine
    case QuitAdminMode
    case QuitUserMode

    var description: String {
        switch self {
        case .ChooseMode:
            return "자판기를 시작합니다.(종료를 원하면 \"q\"입력)\n1.관리자 모드\n2.사용자 모드\n입력>> "
        case .HasNoItem:
            return "상품이 존재하지 않습니다. - 관리자모드\n"
        case .UnKnown:
            return "Unknown error - 관리자모드\n"
        case .NotEnoughBalance:
            return "잔액 부족!\n"
        case .OutOfStock:
            return "재고 없음!\n"
        case .AskInputAgain:
            return "## 메뉴를 다시 입력해주세요. ##\n"
        case .AdminModeAction:
            return "<< 관리자 모드 >>\n원하는 동작과 음료 번호를 선택하세요.\n"
        case .QuitVendingMachine:
            return "## 자판기를 종료합니다 ## \n"
        case .QuitAdminMode:
            return "## 관리자 모드를 종료합니다. ##\n"
        case .QuitUserMode:
            return "## 사용자 모드를 종료합니다. ##\n"
        }

    }

}




