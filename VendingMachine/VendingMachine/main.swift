//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    guard
    let milk1  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "날마다딸기우유", manufacturingDate: "20171009"),
    let milk2 = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "날마다딸기우유", manufacturingDate: "20171012"),
    let soda1 = Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005"),
    let coffe1 = TopCoffee(barnd: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010") else {
            return 
    }
    
    print(milk1)
    print(milk2)
    print(soda1)
    print(coffe1)
    
}


main()
