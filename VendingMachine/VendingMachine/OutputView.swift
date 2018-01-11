//
//  OutputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol ResultPrintable: CustomStringConvertible {
    var description: String { get }
}

struct OutputView {
    private let printData: [ResultPrintable]
    
    init(data: [ResultPrintable]) {
        self.printData = data
    }
    
    func printResult() {
        for data in printData {
            print(data.description)
        }
    }
}
