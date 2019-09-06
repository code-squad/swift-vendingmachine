//
//  RequestFactory.swift
//  VendingMachine
//
//  Created by 이동영 on 03/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct RequestFactory {
    static func create(authority: Authority, input: String) throws -> Request {
        let numbers = input
            .split(separator: " ")
            .map { Int($0) }
        guard
            numbers.count == 2,
            let menu = numbers[0],
            let value = numbers[1],
            value > 0
            else { throw InputError.wrongFormat }
        switch (authority, menu) {
        case (.admin, 1):
            guard
                let product = ProductFactory.create(index: value)
                else { throw InputError.invalidMenu }
            return .inStock(product: product)
        case (.admin, 2):
            return .deStock(index: value)
        case (.user, 1):
            return .insert(amount: value)
        case (.user, 2):
            return .purchase(index: value)
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
