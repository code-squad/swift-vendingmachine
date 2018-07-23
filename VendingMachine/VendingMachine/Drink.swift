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
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension String{
    func toDate(format:String)->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
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
        return ("\(String(describing: type(of: self))) - \(brand), \(size)ml, \(price)원, \(brand), \(manufacturingDate.toString(format: dateFormat)!)")
    }
}

/// lowFat 체크 프로토콜
protocol CheckLowFat {
    func isLowFat() -> Bool
}
/// 우유 클래스
class Milk : Drink, CheckLowFat {
    private let lowFat : Bool
    
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, lowFat: Bool) {
        self.lowFat = lowFat
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isLowFat() -> Bool {
        return self.lowFat
    }
}

/// lowSugar 체크 프로토콜
protocol CheckLowSugar {
    func isLowSugar()->Bool
}
class ChocoMilk : Milk , CheckLowSugar{
    let lowSugar : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, lowFat: Bool, lowSugar:Bool) {
        self.lowSugar = lowSugar
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate, lowFat: lowFat)
    }
    func isLowSugar() -> Bool {
        return self.lowSugar
    }
}
/// isPET 체크 프로토콜
protocol CheckPET {
    func isPET()->Bool
}
/// 탄산음료 클래스
class Soda : Drink, CheckPET {
    private let PET : Bool
    
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, PET: Bool) {
        self.PET = PET
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isPET() -> Bool {
        return self.PET
    }
}
/// zeroCalorie 체크 프로토콜
protocol CheckZeroCalorie {
    func isZeroCalorie()->Bool
}
class Coke : Soda, CheckZeroCalorie {
    private let zeroCalorie : Bool
    
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, PET: Bool,zeroCalorie:Bool) {
        self.zeroCalorie = zeroCalorie
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate, PET: PET)
    }
    func isZeroCalorie() -> Bool {
        return self.zeroCalorie
    }
}

/// hot 체크 프로토콜
protocol CheckHot {
    func isHot()->Bool
}
/// 커피 클래스
class Coffee : Drink, CheckHot{
    private let hot : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, hot: Bool) {
        self.hot = hot
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isHot() -> Bool {
        return self.hot
    }
}
/// zeroSugar 체크 프로토콜
protocol CheckZeroSugar {
    func isZeroSugar()->Bool
}
class TopCoffee : Coffee, CheckZeroSugar{
    private let zeroSugar : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String,hot: Bool, zeroSugar: Bool) {
        self.zeroSugar = zeroSugar
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate,hot: hot)
    }
    func isZeroSugar() -> Bool {
        return self.zeroSugar
    }
}
/// noCaffeine 체크 프로토콜
protocol CheckNoCaffeine {
    func isNoCaffeine()->Bool
}
/// 에너지 드링크 클래스
class EnergyDrink : Drink, CheckNoCaffeine {
    private let noCaffeine : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, noCaffeine: Bool) {
        self.noCaffeine = noCaffeine
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isNoCaffeine() -> Bool {
        return self.noCaffeine
    }
}

