//
//  Beverage.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol Beverage {
    var brand: String {get set}
    var weight: Int {get set}
    var price: Int {get set}
    var name: String {get set}
    var manufactureDate: Date {get set}
}
