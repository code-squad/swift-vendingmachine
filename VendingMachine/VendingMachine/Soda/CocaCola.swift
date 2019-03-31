//
//  CocaCola.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CocaCola: Soda {
    
    private let coloring: String?
    
    init() {
        self.coloring = "Black"
        super.init(
            brand: "코카콜라",
            volume: 355,
            price: 1500,
            name: "코카콜라",
            manufacturedDate: Date.changeString(beforeDate: "20190213"),
            suger: true)
    }
    
    func isColoring() -> String? {
        guard let coloring = coloring else {
            return nil
        }
        return coloring
    }
    
}
