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
    drinks.append(ChocoMilk(name: "서울우유", volume: 200, price: 1000, brand: "낢마다초코우유", date: "20170610"))
    drinks.append(ChocoMilk(name: "서울우유", volume: 200, price: 1000, brand: "낢마다초코우유", date: "20171012"))
    drinks.append(Cider(name: "칠성사이다", volume: 350, price: 2000, brand: "다이어트사이다", date: "20171005"))
    drinks.append(Cantata(name: "맥심", volume: 350, price: 3000, brand: "Cantata마끼아또", date: "20171010"))

    for drink in drinks {
        print(drink)
    }
}

main()


