//
//  Drink.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 날자 입출력 포맷. 전역변수로 선언
let dateFormat = "yyyyMMdd"

extension Date {
    func toString (format:String)->String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension String{
    func toDate(format:String)->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

/// 모든 음료수의 수퍼클래스
class Drink : CustomStringConvertible {
    private let brand : String
    private let size : Int
    private let price : Int
    private let name : String
    private let manufacturingDate : Date
    
    init?(barnd:String, size:Int,price:Int, name:String, manufacturingDate:String) {
        self.brand = barnd
        self.size = size
        self.price = price
        self.name = name
        guard let date = manufacturingDate.toDate(format: dateFormat) else {
            return nil
        }
        self.manufacturingDate = date
    }
    
    var description : String  {
        // 생성자에서 dateFormat 옵셔널 검사가 완료 됬으므로 여기선 강제 래핑
        return ("\(brand), \(size)ml, \(price)원, \(brand), \(manufacturingDate.toString(format: dateFormat)!)")
    }
}

/// 우유 클래스
class Milk : Drink {
}
class ChocoMilk : Milk {
}

/// 탄산음료 클래스
class Soda : Drink {
}
class Coke : Soda {
}

/// 커피 클래스
class Coffee : Drink{
}
class TopCoffee : Coffee{
}


