//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let bananaMilk = BananaMilk()

let cocaCola = Sprite()

let starbucksCoffee = StarbucksCoffee()

let beverages: [Beverage] = [bananaMilk, cocaCola,starbucksCoffee]

beverages.forEach {
    beverage in
    print("\(beverage.className) - \(beverage)")
}

// 하루에 86400 초 ;; ㅡㅡ 그럼 날짜에 저걸 곱해줘야한다.
print(Date.addDate(addDay: 5, day: Date()))

// 날짜가 지났는지 확인해보자.
let dddd = Date.addDate(addDay: 5, day: Date.changeString(beforeDate: "20171225"))
// 2017년도12월25일꺼니깐 당연히 지금은 상했다.
print(Date.isEqualDate(manufacturedDate: dddd))
