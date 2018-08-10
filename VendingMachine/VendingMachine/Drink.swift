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

/// 음료의 이름과 가격을 리턴하는 함수.
protocol DrinkDetail {
    func getName()->String
    func getPrice()->Int
}

/// 모든 음료수의 수퍼클래스
class Drink : CustomStringConvertible, DrinkDetail {
    private let brand : String
    private let size : Int
    private let price : Int
    private let name : String
    private let manufacturingDate : Date
    
    func getPrice() ->Int {
        return self.price
    }
    func getName() ->String {
        return self.name
    }
    
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

/// 우유 클래스
class Milk : Drink {
    private let lowFat : Bool
    
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, lowFat: Bool) {
        self.lowFat = lowFat
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isLowFat() -> Bool {
        return self.lowFat
    }
}

class ChocoMilk : Milk {
    let lowSugar : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, lowFat: Bool, lowSugar:Bool) {
        self.lowSugar = lowSugar
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate, lowFat: lowFat)
    }
    func isLowSugar() -> Bool {
        return self.lowSugar
    }
}

/// 탄산음료 클래스
class Soda : Drink {
    private let usingPET : Bool
    
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, usingPET: Bool) {
        self.usingPET = usingPET
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isPET() -> Bool {
        return self.usingPET
    }
}

class Coke : Soda {
    private let zeroCalorie : Bool
    
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, usingPET: Bool,zeroCalorie:Bool) {
        self.zeroCalorie = zeroCalorie
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate, usingPET: usingPET)
    }
    func isZeroCalorie() -> Bool {
        return self.zeroCalorie
    }
}

/// 커피 클래스
class Coffee : Drink{
    private let hot : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, hot: Bool) {
        self.hot = hot
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isHot() -> Bool {
        return self.hot
    }
}

class TopCoffee : Coffee {
    private let zeroSugar : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String,hot: Bool, zeroSugar: Bool) {
        self.zeroSugar = zeroSugar
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate,hot: hot)
    }
    func isZeroSugar() -> Bool {
        return self.zeroSugar
    }
}

/// 에너지 드링크 클래스
class EnergyDrink : Drink {
    private let zeroCaffeine : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, zeroCaffeine: Bool) {
        self.zeroCaffeine = zeroCaffeine
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    func isNoCaffeine() -> Bool {
        return self.zeroCaffeine
    }
}

