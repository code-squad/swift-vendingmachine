//
//  Milk.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Milk: Beverage {
    private let grade: Grades
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufacturedDate: String, _ grades: Grades) {
        self.grade = grades
        super.init(brand, weight, price, name, manufacturedDate)
    }

    override var expirationDate: Date? {
        guard let manufacturingDate = DateAndTime.formatter.date(from: self.manufacturedDate) else {
            return nil
        }
        return Date(timeInterval: DateAndTime.fourtyFiveDaysAsSeconds, since: manufacturingDate)
    }

}

enum Grades {
    case firstGrade, secondGrade, thirdGrade
}

enum Standars: Float {
    case ofLowCalorie = 40.0
    case ofHighConcentration = 1.0
}
