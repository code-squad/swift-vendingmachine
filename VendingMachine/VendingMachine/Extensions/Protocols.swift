//
//  Protocols.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

typealias Change = Int

protocol Userable {
    func insertMoney(coin: Money.Unit)
    func countChange() -> Change
}
