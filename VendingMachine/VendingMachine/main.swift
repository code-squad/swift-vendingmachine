//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


func main() {
    var drinks: [Beverage] = []
    
    drinks.append(ChocoMilk(name: "서울우유", volume: 200, price: 1000, brand: "날마다초코우유", date: "20170610", fat: true, cocoaAmount: 1.1))
    drinks.append(BananaMilk(name: "서울우유", volume: 200, price: 1500, brand: "날마다바나나우유", date: "20170615", fat: true, bananaAmount: 1.3))
    drinks.append(Cola(name: "펩시", volume: 300, price: 1000, brand: "다이어트콜라", date: "20191111", isZeroCalorie: false, sugarAmount: 0.7))
    drinks.append(TOP(name: "맥심", volume: 350, price: 3500, brand: "TOP아메리카노", date: "20181226", caffeineAmount: 1.5, topKind: .sweetAmericano))

    for drink in drinks {
        print(drink)
    }
}

main()


