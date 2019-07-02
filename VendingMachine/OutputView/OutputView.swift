//
//  OutputView.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class OutputView {
    
    static func printBeverage(_ drink: Drinkable){
        let output = { (drink) in
            print(drink)
        }
        drink.display(printFormat: output)
    }
}
