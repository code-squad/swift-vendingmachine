//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var welchs = Welchs("톡쏘는정훈", 400, 1500, "웰치스", "20171105", 40, .grape)
var chocoFlavoredMilk = ChocoFlavoredMilk("달콤한정훈", 250, 1700, "맛좋은초코유유", "20180301", .second_Grade, 200, 1)
var top = Top("분위기있는정훈", 200, 1500, "TOP", "20171225", .grande, .basic)
var dutchCoffeeStory = DutchCoffeeStory("분위기있는정훈", 300, 3000, "더치커피스토리", "20171005", .short, .forGiftUse)
var beverages: [Printable] = [chocoFlavoredMilk, top, dutchCoffeeStory, welchs]
beverages.forEach {
    OutputView.printBeverage(species: $0)
}
