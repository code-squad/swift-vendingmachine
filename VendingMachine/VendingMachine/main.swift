//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    print(StrawBerryMilk("서울우유", 200, 1000, "날마다딸기우유", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*7), 210, manufacturerCode: 1001, packingMaterial: "종이"))
    print(BananaMilk("서울우유", 200, 1000, "날마다바나나우유", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*7), 220, manufacturerCode: 1001, packingMaterial: "종이"))
    print(ChocoMilk("서울우유", 200, 1000, "날마다초코우유", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*7), 240, manufacturerCode: 1001, packingMaterial: "종이"))
    print(CokeSoftDrink("펩시", 350, 2000, "다이어트콜라", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*30*6), 250, carbonContent: 50))
    print(CiderSoftDrink("롯데칠성음료", 350, 2000, "사이다", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*30*6), 250, carbonContent: 60))
    print(FantaSoftDrink("코카콜라컴퍼니", 350, 2000, "환타", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*30*7), 300, carbonContent: 40))
    print(TopCoffee("맥심", 200, 2200, "티오피", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*14), 240, caffeineLevels: 20, isHot: false, isSweetened: true))
    print(CantataCoffee("롯데칠성음료", 200, 2200, "칸타타", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*14), 250, caffeineLevels: 10, isHot: false, isSweetened: true))
    print(GeorgiaCoffee("코카콜라", 200, 2200, "조지아커피", Date.init(timeIntervalSinceNow: 0), Date.init(timeIntervalSinceNow: 60*60*24*2), 100, caffeineLevels: 25, isHot: true, isSweetened: false))
}

main()
