//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let oneDay: TimeInterval = 86400

func main() {
    let milk = Beverage(brand: "빙그레", size: 240, price: 1200, name: "귤맛 우유", openDate: Date(timeIntervalSinceNow: oneDay * 4))
    
    let cola = Beverage(brand: "코카콜라", size: 185, price: 1300, name: "코카콜라", openDate: Date(timeIntervalSinceNow: oneDay * 287))
    
    print(milk)
    print(cola)
}

main()

