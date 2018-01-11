//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let today = DateUtility.today()
let cocaCola = CocaCola(brand: "코카콜라", volume: 350, price: 2000, productName: "다이어트콜라", expiryDate: today, calorie: 100, carbonicAcid: "탄산낮음")
let pepci = Pepci(brand: "펩시", volume: 350, price: 2000, productName: "펩시", expiryDate: today, calorie: 250, carbonicAcid: "탄산높음")

let printingData: [OutputPrintable] = [cocaCola, pepci]

OutputView(data: printingData).printResult()

