//
//  OutputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printResult(beverage: Beverage) {
        print("\(beverage.description)를 구매하셨습니다. \(beverage.price)원을 차감합니다.", terminator: "\n")
    }
}
