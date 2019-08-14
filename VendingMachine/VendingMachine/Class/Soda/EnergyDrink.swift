//
//  RedBull.swift
//  VendingMachine
//
//  Created by 이동영 on 14/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class EnergyDrink: Soda {
    // MARK: - Properties
    private let caffeineContent: Int
    
    var isHighCaffeine: Bool {
        return 100 < self.caffeineContent
    }
    
    // MARK: - Methods
    
    /// initialize instance of EnergyDrink
    ///
    /// - Parameter brand: brand name. default is "제조사".
    /// - Parameter capacity: product capacity. default is 0.
    /// - Parameter price: Int to  product price. default is 0.
    /// - Parameter name: a string product name. default is "에너지 드링크".
    /// - Parameter productDate: product date. default is current date.
    /// - Parameter isSugerFree: a bool indicating whether or not has suger. default is false.
    /// - Parameter caffeineContent: a int value how many contain caffeine
    /// ⚠️ if this parameter is greater than `capacity`, this value be allocated `conpacity`
    init(brand: String = "제조사",
         capacity: Int = 0,
         price: Int = 0,
         name: String = "에너지 드링크",
         productDate: Date = Date(),
         isSugerFree: Bool = false,
         caffeineContent: Int = 50) {
        self.caffeineContent = caffeineContent > capacity ? capacity : caffeineContent
        
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   productDate: productDate,
                   isSugerFree: isSugerFree)
    }
    
}
