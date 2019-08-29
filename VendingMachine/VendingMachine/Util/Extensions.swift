//
//  Extensions.swift
//  VendingMachine
//
//  Created by 이동영 on 13/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

func print<T: Beverage>(beverage: T) {
    print("\(type(of: beverage)) - \(beverage.description)")
}
// MARK: - Date Extension
extension Date {
    var text: String {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyyMMdd"
        return dateFormmater.string(from: self)
    }
}
// MARK: - Int Extesion
extension Int {
    var dayDuration: TimeInterval {
        let secOfDay = 86400
        return TimeInterval(self * secOfDay)
    }
}
// MARK: - Array Extension
extension Array where Element == String {
    var countDictionary: [String: Int] {
        var statistic = [String: Int]()
        self.forEach { statistic[$0] = (statistic[$0] ?? 0) + 1 }
        return statistic
    }
}
// MARK: - Dictionary Extension
extension Dictionary where Key == String, Value == Int {
    var sortedList: [(String, Int)] {
        return self.sorted(by: <)
    }
}
