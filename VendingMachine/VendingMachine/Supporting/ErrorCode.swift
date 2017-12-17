//
//  ErrorCode.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 15..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

enum ErrorCode: Error {
    case noStock
    case noMoney
    
    var localizedDescription: String {
        switch self {
        case .noStock:
            return "품절입니다. 😃"
        case .noMoney:
            return "잔액이 부족합니다. 😱"
        }
    }
}
