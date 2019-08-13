//
//  CoffeeTests.swift
//  BeverageTests
//
//  Created by 이동영 on 14/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CoffeeTests: XCTestCase {
    
    func testCoffeeDescription() {
        //Given
        let brand = "코드스쿼드"
        let capacity = 200
        let price = 500
        let name = "커피"
        let current =  Date()
        
        let beverage = Coffee(
            brand: brand,
            capacity: capacity,
            price: price,
            name: name,
            productDate: current)
        let expected = "\(brand), \(capacity)ml, \(price)원, \(name), \(current.text)"
        
        //When
        let result = beverage.description
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testAmericano() {
        //Given
        let brand = "빽다방"
        let capacity = 900
        let price = 500
        let name = "앗!메리카노"
        let current =  Date()
        let waterContent = 400
        
        let americano = Americano(brand: brand,
                                 capacity: capacity,
                                 price: price,
                                 name: name,
                                 productDate: current,
                                 waterContent: waterContent)
        let expected = true
        //When
        let result = americano.isWatery
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testCafeLatte() {
            //Given
            let brand = "스타벅스"
            let capacity = 900
            let price = 500
            let name = "돌체 라떼"
            let current =  Date()
            let milkContent = 400
            
            let cafeLatte = CafeLatte(brand: brand,
                                     capacity: capacity,
                                     price: price,
                                     name: name,
                                     productDate: current,
                                     milkContent: milkContent)
            let expected = true
            //When
            let result = cafeLatte.isSoft
            
            //Then
            XCTAssertEqual(result, expected)
        }
    
}
