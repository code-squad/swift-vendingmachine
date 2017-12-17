//
//  ErrorCode.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 15..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

enum ErrorCode: Error, CustomStringConvertible {
    case inValidError
    case noStock
    case noMoney
    case validInputString
    case invalidMenu
    
    var description: String {
        switch self {
        case .noStock:
            return "품절입니다. 😃"
        case .noMoney:
            return "잔액이 부족합니다. 😱"
        case .validInputString:
            return "입력값을 확인하세요!😱"
        case .invalidMenu:
            return "메뉴의 입력값을 확인해주세요."
        case .inValidError:
            return "알수없는 에러입니다."
        }
    }
}
