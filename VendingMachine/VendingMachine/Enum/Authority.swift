//
//  Authority.swift
//  VendingMachine
//
//  Created by 이동영 on 02/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Authority: Int {
    case none
    case admin = 1
    case user
    
    init(index: Int?) {
        guard
            let index = index
            else {
                self = .none
                return
        }
        self = Authority.init(rawValue: index) ?? .none
    }
    
}
