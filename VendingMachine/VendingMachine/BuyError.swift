//
//  BuyError.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum BuyError: Error {
    case NotEnoughBalance
    case NonStock
    case NonHaveIndex
    
    var localizedDescription: String {
        switch self {
        case .NotEnoughBalance:
            return "금액이 부족합니다."
        case .NonStock:
            return "해당 음료의 재고가 없습니다."
        case .NonHaveIndex:
            return "해당 번호에 해당하는 음료는 없습니다. 번호를 확인해주세요."
        }
    }
}
