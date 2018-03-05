//
//  Attribute.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
// 음료수의 용기 패키지 타입 enum 선언
enum Package {
    case Can
    case Bottle
    case PET
    case Carton
}

protocol Attribute {
    func package() -> Package
    //func isValid() -> Bool
}

