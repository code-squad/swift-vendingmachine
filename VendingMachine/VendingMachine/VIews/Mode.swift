//
//  Mode.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum ModeType: Int, CustomStringConvertible {
    case admin = 1
    case user
    case exit
    
    var description: String {
        switch self {
        case .admin:
            return "관리자 모드"
        case .user:
            return "사용자 모드"
        case .exit:
            return "나가기"
        }
    }
}

enum UserMode: Int, CustomStringConvertible {
    case insertMoney = 1
    case buyBeverage
    case exit
    
    var description: String {
        switch self {
        case .buyBeverage:
            return "음료구매"
        case .insertMoney:
            return "금액추가"
        case .exit:
            return "모드선택"
        }
    }
}

enum AdminMode: Int, CustomStringConvertible {
    case addBeverages = 1
    case substractBeverages
    case salesHistory
    case exit

    var description: String {
        switch self {
        case .addBeverages:
            return "재고추가"
        case .substractBeverages:
            return "재고차감"
        case .salesHistory:
            return "판매이력"
        case .exit:
            return "모드선택"
        }
    }
}
