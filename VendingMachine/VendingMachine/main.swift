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
    let lactoseFreeMilk = LactoseFreeMilk(openDate: Date(before: 3))
    let starbucksDoubleShot = StarbucksDoubleShot(openDate: Date(before: 6))
    let topTheBlack = TOPTheBlack(openDate: Date(before: 7))
    let cocaCola = CocaCola(openDate: Date(before: 4))
    let cocaColaZero = CocaColaZero(openDate: Date(before: 9))
    
    print(mandarineMilk)
    print(lactoseFreeMilk)
    print(starbucksDoubleShot)
    print(topTheBlack)
    print(cocaCola)
    print(cocaColaZero)
}

main()

