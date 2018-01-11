//
//  OutputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    private let printingData: [CustomStringConvertible]
    
    init(data: [CustomStringConvertible]) {
        self.printingData = data
    }
    
    func printResult() {
        for data in printingData {
            print(data.description)
        }
    }
}
