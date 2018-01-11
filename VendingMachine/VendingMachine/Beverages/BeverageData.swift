//
//  InputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct BeverageData {
    static func makeIntances() -> [CustomStringConvertible] {
        let today = DateUtility.today()
        let cocaCola = CocaCola(brand: "코카콜라", volume: 350, price: 2000, productName: "다이어트콜라", expiryDate: today, calorie: 100, carbonicAcid: "탄산낮음")
        let pepci = Pepci(brand: "펩시", volume: 350, price: 2000, productName: "펩시", expiryDate: today, calorie: 250, carbonicAcid: "탄산높음")
        let strawberryMilk = StrawberryMilk(brand: "서울우유", volume: 200, price: 1000, productName: "날마다딸기우유", expiryDate: today, calorie: 250, fatRate: 40)
        let bananaMilk = BananaMilk(brand: "서울우유", volume: 200, price: 3000, productName: "날마다바나나우유", expiryDate: today, calorie: 250, fatRate: 20)
        let georgia = Georgia(brand: "조지아커피", volume: 150, price: 1000, productName: "조지아 아메리카노", expiryDate: today, calorie: 250, temperature: 90)
        
        let printingData: [CustomStringConvertible] = [strawberryMilk, bananaMilk, cocaCola, pepci, georgia]
        
        return printingData
    }
}
