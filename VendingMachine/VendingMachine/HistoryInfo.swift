//
//  HistoryInfo.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct HistoryInfo {
    private(set) var purchasingDate: Date
    private(set) var purchasedMenu: VendingMachine.Menu.RawValue
    private(set) var count: Purchased
}
