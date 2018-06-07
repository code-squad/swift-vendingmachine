//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    
    // Milk
    let strawberryMilk: StrawberryMilk = StrawberryMilk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다딸기우유", manufacturedDate: "20171009", containRealStrawberry: true)
    let chocoMilk: ChocoMilk = ChocoMilk(brand: "서울우유", capacity: 200, price: 1000, name: "날마다초코우유", manufacturedDate: "20171012", hasCacao: false)
    
    // Soda
    let coke: Coke = Coke(brand: "펩시", capacity: 350, price: 2000, name: "다이어트콜라", manufacturedDate: "20171005", calories: 0, hasIce: true)
    let sprite: Sprite = Sprite(brand: "칠성", capacity: 350, price: 2000, name: "칠성사이다", manufacturedDate: "20180606", calories: 120, hasOneMoreOnCap: true)
    
    // Coffee
    let topCoffee: TOP = TOP(brand: "맥심", capacity: 400, price: 3000, name: "TOP아메리카노", manufacturedDate: "20171010", caffeineContent: 35.5, canColor: .yellow)
    let cantataCoffee: Cantata = Cantata(brand: "칸타타", capacity: 400, price: 3000, name: "칸타타블렌디드", manufacturedDate: "20180505", caffeineContent: 35.5, flavor: "에메랄드블렌디드")
    let georgiaCoffee: Georgia = Georgia(brand: "조지아", capacity: 400, price: 3000, name: "조지아오리지널", manufacturedDate: "20180607", caffeineContent: 40, flavor: "아라비카오리지널")
    
    print(strawberryMilk)
    print(chocoMilk)
    print(coke)
    print(sprite)
    print(topCoffee)
    print(cantataCoffee)
    print(georgiaCoffee)
}

main()
