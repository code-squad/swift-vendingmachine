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
        let chocoMilk  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "날마다딸기우유", manufacturingDate: "20171009", lowFat: true, lowSugar: true)
            ,
        let hot6 = EnergyDrink(
            barnd: "서울우유", size: 200, price: 1000, name: "날마다딸기우유", manufacturingDate: "20171012", zeroCaffeine: true),
            let coke = Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: false),
            let topCoffee = TopCoffee(barnd: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010", hot: false, zeroSugar: false)
        else {
            return ()
    }
    
    print(chocoMilk)
        print(hot6)
        print(coke)
        print(topCoffee)
    
}


main()

