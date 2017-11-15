//
//  StringExtension.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

extension String {

    func convert(to measure: String) -> Int? {
        let startMeasureCharacter = self.index(self.endIndex, offsetBy: (measure.count * (-1)))
        let range = startMeasureCharacter...self.index(before: self.endIndex)
        if self[range] != measure {
            return nil
        }
        guard let resultNumberOfMeasure = Int(
            self[self.startIndex...self.index(before: startMeasureCharacter)]) else {
                return nil
        }
        return resultNumberOfMeasure
    }

}
