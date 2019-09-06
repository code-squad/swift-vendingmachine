//
//  AdminInputView.swift
//  VendingMachine
//
//  Created by 이동영 on 03/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct AdminInputView: InputView {
    enum Menu: Int, CustomStringConvertible, CaseIterable {
        case inStock = 1
        case deStock
        
        var description: String {
            switch self {
            case .inStock:
                return "\(rawValue). 재고 추가 ✅"
            case .deStock:
                return "\(rawValue). 재고 삭제 ⛔️"
            }
        }
    }
    
    func fetchInput() -> String {
        Menu.allCases.forEach { print($0) }
        return readLine() ?? ""
    }
}
