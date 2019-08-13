//
//  SweetMilk.swift
//  VendingMachine
//
//  Created by 이동영 on 14/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk, Sweetable {
    // MARK: - Properties
    private let chocolateContent: Int
    var isSweet: Bool {
        return chocolateContent > 20
    }
    
    // MARK: - Methods
    /// ChocolateMilk 초기화 이니셜라이저
    /// - Parameter brand: 브랜드 명
    /// - Parameter capacity: 용량
    /// - Parameter price: 가격
    /// - Parameter name: 상품명
    /// - Parameter productDate: 제조일자
    /// - Parameter hasLowFat: 저지방 여부
    /// - Parameter hasLactase: 락타아제 포함 여부
    /// - Parameter chocolateContent: 초콜렛 함유량 ⚠️ capacity보다 큰 수를 입력하면 capacity로 자동 조정됩니다.
    init(brand: String = "제조사",
         capacity: Int = 0,
         price: Int = 0,
         name: String = "초코우유",
         productDate: Date = Date(),
         hasLowFat: Bool = false,
         hasLactase: Bool = false,
         chocolateContent: Int = 30) {
        self.chocolateContent = chocolateContent > capacity ? capacity : chocolateContent
        
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   productDate: productDate,
                   hasLowFat: hasLowFat,
                   hasLactase: hasLactase)
    }
    
}
