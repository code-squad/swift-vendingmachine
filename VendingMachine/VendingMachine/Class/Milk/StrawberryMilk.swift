//
//  SweetMilk.swift
//  VendingMachine
//
//  Created by 이동영 on 14/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk, Sweetable {
    // MARK: - Properties
    private let strawberryContent: Int
    var isSweet: Bool {
        return strawberryContent > 30
    }
    
    // MARK: - Methods
    
    /// StrawberryMilk 초기화 이니셜라이저
    /// - Parameter brand: 제조사명
    /// - Parameter capacity: 용량
    /// - Parameter price: 가격
    /// - Parameter name: 상품명
    /// - Parameter productDate: 제조일자
    /// - Parameter hasLowFat: 저지방 여부
    /// - Parameter hasLactase: 락타아제 포함 여부
    /// - Parameter chocolateContent: 딸기 함유량 ⚠️ capacity보다 큰 수를 입력하면 capacity로 자동 조정됩니다.
    init(brand: String = "제조사",
         capacity: Int = 0,
         price: Int = 0,
         name: String = "딸기우유",
         productDate: Date = Date(),
         hasLowFat: Bool = false,
         hasLactase: Bool = false,
         strawberryContent: Int = 30) {
        self.strawberryContent = strawberryContent > capacity ? capacity : strawberryContent
        
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   productDate: productDate,
                   hasLowFat: hasLowFat,
                   hasLactase: hasLactase)
    }
    
}
