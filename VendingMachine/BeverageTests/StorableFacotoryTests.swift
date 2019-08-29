//
//  ProductFactoryTests.swift
//  BeverageTests
//
//  Created by 이동영 on 29/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class StorableFacotoryTests: XCTestCase {

    func testCreateCola() {
        //Given
        let quantity = 2
        //When
        let products = StorableFactory.create(categories: [.cola], quantity: quantity)
        //Then
        XCTAssertEqual(products.statistic.first!.menu, Cola().productDescription)
        XCTAssertEqual(products.statistic.first!.count, quantity)
    }
    
    func testCreateAll() {
        //Given
        let quantity = 2
        let expected = Category.allCases
            .map { $0.instance.productDescription }
            .sorted(by: <)
            
        let products = StorableFactory.create(quantity: quantity)
        XCTAssertEqual(products.statistic.map { $0.menu }, expected )
    }
}
