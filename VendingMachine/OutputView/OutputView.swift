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
        let output = { (_ drink:  Drinkable) in
            guard let beverage = drink as? Drink else{
                return
            }
            print(beverage)
        }
        drink.display(printFormat: output)
    }
}
