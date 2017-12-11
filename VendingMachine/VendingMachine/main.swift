//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let today = Date(timeIntervalSinceNow: 0)
    let strawBerryMilk = Milk(selectedMenu: .strawberry, "서울우유", 200, 1000, "날마다딸기우유", today)
    let bananaMilk = Milk(selectedMenu: .banana, "서울우유", 200, 1000, "날마다바나나우유", today)
    let dietCoke = SoftDrink(selectedMenu: .coke, "펩시", 350, 2000, "다이어트콜라", today)
    let topAmericano = Coffee(selectedMenu: .top, "맥심", 400, 3000, "TOP아메리카노", today)
    print(strawBerryMilk)
    print(bananaMilk)
    print(dietCoke)
    print(topAmericano)
}

main()
