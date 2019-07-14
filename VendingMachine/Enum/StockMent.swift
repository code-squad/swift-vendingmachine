//
//  StockMent.swift
//  VendingMachine
//
//  Created by jang gukjin on 14/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum StockMent: String {
    case addStock = "추가할 재고의 갯수입력: "
    case deleteStock = "제거할 재고의 갯수입력: "
    
    init(input: String) {
        switch input{
        case "add","Add": self = .addStock
        default: self = .deleteStock
        }
    }
}
