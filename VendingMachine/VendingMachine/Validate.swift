//
//  Validate.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 28..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol Validate {
    func validate(_ today: Date) -> Bool
}
