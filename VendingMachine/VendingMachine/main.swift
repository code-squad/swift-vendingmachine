//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let mandarineMilk = MandarineMilk(openDate: Date(before: 2))
    let cocaCola = CarbonatedDrink(openDate: Date(before: 4))
    let starbucksDoubleShot = StarbucksDoubleShot(openDate: Date(before: 6))
    
    print(mandarineMilk)
    print(cocaCola)
    print(starbucksDoubleShot)
}

main()

