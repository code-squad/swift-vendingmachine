//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김성현 on 24/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage {
    /*
    객체지향 프로그래밍 방식으로 아래 예시 음료를 추상화하는 클래스(class)를 설계한다.
    (자기만의 기준으로) 클래스 이름을 정한다.
    필수 속성 : 브랜드(String), 용량(Int), 가격(Int), 이름(String), 제조일자(Date)
    우유 - 딸기우유, 초코우유, 바나나우유 택 1
    탄산음료 - 콜라, 사이다, 환타 택 1
    커피 - TOP, 칸타타, 조지아 택 1
    음료 상품 클래스 출력을 위해서 CustomStringConvertible 프로토콜을 추가하고 구현한다.
    main에서 특정한 음료수 객체 인스턴스를 클래스별로 구분해서 print() 함수로 출력한다.
    출력 형식 예시 : 제조사, 용량, 가격, 브랜드, 제조일자
    */
    
    private var brand: String
    private var packageSize: Int
    private var price: Int
    private var name: String
    private var dateOfManufacture: Date
    
    init(brand: String, packageSize: Int, price: Int, name: String, dateOfManufacture: Date) {
        self.brand = brand
        self.packageSize = packageSize
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
    
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(packageSize), \(price), \(name), \(dateOfManufacture)"
    }
}
