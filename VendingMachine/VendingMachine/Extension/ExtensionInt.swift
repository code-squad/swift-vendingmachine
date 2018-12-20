//
//  ExtensionInt.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 20..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

extension Int {
    func convertToDay() -> Double {
        return Double(self * 86400)
    }
}
