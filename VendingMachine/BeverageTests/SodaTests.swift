//
//  SodaTests.swift
//  BeverageTests
//
//  Created by 이동영 on 14/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class SodaTests: XCTestCase {
    
    func testSodaDescription() {
        
        //Given
        let brand = "코드스쿼드"
        let capacity = 200
        let price = 500
        let name = "탄산음료"
        let current =  Date()
        
        let beverage = Soda(
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
    
    func testCola() {
        
        //Given
        let brand = "코카-콜라 컴퍼니"
        let capacity = 500
        let price = 2500
        let name = "코카-콜라"
        let current =  Date()
        let cocaberryContent = 50
        
        let coke = Cola(brand: brand,
                        capacity: capacity,
                        price: price,
                        name: name,
                        productDate: current,
                        cocaberryContent: cocaberryContent)
        let expected = true
        
        //When
        let result = coke.isAddictive
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testStrawberryMilk() {
        
        //Given
        let brand = "레드불 컴퍼니"
        let capacity = 500
        let price = 2500
        let name = "레드불"
        let current =  Date()
        let caffeineContent = 50
        
        let redBull = EnergyDrink(brand: brand,
                               capacity: capacity,
                               price: price,
                               name: name,
                               productDate: current,
                               caffeineContent: caffeineContent)
        let expected = false
        
        //When
        let result = redBull.isHighCaffeine
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
}
