//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let milk = Beverage(brand: "빙그레", size: 240, price: 1200, name: "귤맛 우유", openDate: Date())
    
    let cola = Beverage(brand: "코카콜라", size: 185, price: 1300, name: "코카콜라", openDate: Date())
    
    let starbucksCoffee = Beverage(brand: "동서식품", size: 200, price: 1400, name: "스타벅스 더블샷 에스프레소 & 크림", openDate: Date())
    
    print(milk)
    print(cola)
    print(starbucksCoffee)
}

main()

