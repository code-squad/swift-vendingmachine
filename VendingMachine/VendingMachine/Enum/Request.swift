//
//  Input.swift
//  VendingMachine
//
//  Created by 이동영 on 16/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Request {
    case insert(amount: Int)
    case purchase(index: Int)
    
    init(input: String) throws {
        let ints = input
            .split(separator: " ")
            .map { Int($0) }
        guard
            ints.count == 2,
            let menu = ints[0],
            let value = ints[1],
            value > 0
            else { throw InputError.wrongFormat }
        switch menu {
        case 1:
            self = .insert(amount: value)
        case 2:
            self = .purchase(index: value)
        default:
            throw InputError.invalidMenu
        }
        
    }
    
    enum InputError: LocalizedError {
        case wrongFormat
        case invalidMenu
        
        var errorDescription: String? {
            switch self {
            case .wrongFormat:
                return "올바른 포맷이 아닙니다."
            case .invalidMenu:
                return "해당하지 메뉴가 존재하지 않습니다."
            }
        }
    }
}

