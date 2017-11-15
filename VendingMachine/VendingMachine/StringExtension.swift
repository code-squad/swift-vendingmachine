//
//  StringExtension.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

extension String {
    var convertToGram: Int? {
        let gramCharacterSet = CharacterSet.init(charactersIn: "g")
        let gramString = self.trimmingCharacters(in: gramCharacterSet)
        guard let gram = Int(gramString) else { return nil }
        return gram
    }
    
    var convertToMilligram: Int? {
        let milligramCharacterSet = CharacterSet.init(charactersIn: "mg")
        let milligramString = self.trimmingCharacters(in: milligramCharacterSet)
        guard let milligram = Int(milligramString) else { return nil }
        return milligram
    }
    
    var convertToKilocalorie: Int? {
        let kilocalorieCharacterSet = CharacterSet.init(charactersIn: "kcal")
        let kilocalorieString = self.trimmingCharacters(in: kilocalorieCharacterSet)
        guard let kilocalorie = Int(kilocalorieString) else { return nil }
        return kilocalorie
    }
}
