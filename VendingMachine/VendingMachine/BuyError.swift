//
//  BuyError.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum BuyError: Error {
    case NotenoughBalance
    
    var localizedDescription: String {
        switch self {
        case .NotenoughBalance:
            return "금액이 부족합니다."
        }
    }
}
