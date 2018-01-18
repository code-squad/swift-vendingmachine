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
    
    var localizedDescription: String {
        switch self {
        case .outOfStock:
            return "재고가 없습니다."
        }
    }
}
