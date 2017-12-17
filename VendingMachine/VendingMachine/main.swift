//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func executeMain() {
    let lightBananaMilk = LightBananaMilk(volume: 270, price: 1200, manufacturingDate: "20171213")
    let realBananaMilk = RealBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171212")
    let originalCoke = Coke(sugarContent: 80, volume: 250, price: 700, name: "CoCaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let coffee = StarBucksCoffee(reserve: true, caffeine: true, temperature: 97, volume: 500, price: 5600, name: "스타벅스아메리카노", manufacturingDate: "20101213")
    let sprite = Sprite(sugarContent: 0, volume: 200, price: 800, name: "선배스프라이트샤워하실래요", manufacturingDate: "20171215", labelColor: "GREEN", forBusiness: false)
    
}
executeMain()
