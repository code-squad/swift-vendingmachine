//
//  Extensions.swift
//  VendingMachine
//
//  Created by 이동영 on 13/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Date {
    var text: String {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyyMMdd"
        return dateFormmater.string(from: self)
    }
}

func print<T: Beverage>(beverage: T) {
    print("\(type(of: beverage)) - \(beverage.description)")
}
