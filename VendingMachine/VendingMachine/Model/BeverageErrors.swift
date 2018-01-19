//
//  BeverageErrors.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum BeverageErrors: Error {
    case outOfStock
    case notEnoughMoney
    case invalidValue
    
    var localizedDescription: String {
        switch self {
        case .outOfStock:
            return "재고가 없습니다."
        case .notEnoughMoney:
            return "돈이 부족합니다."
        case .invalidValue:
            return "유효하지 않는 입력값입니다."
        }
    }
}
