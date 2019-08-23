//
//  Date.swift
//  VendingMachine
//
//  Created by Daheen Lee on 23/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Date {
    init(string: String) {
        self = DateConverter.toDate(from: string)
    }
}
