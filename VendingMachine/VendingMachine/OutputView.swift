//
//  OutputView.swift
//  VendingMachine
//
//  Created by 이동건 on 19/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class OutputView {
    static func display(with comment: Comment) {
        print(comment)
    }
    
    static func display(with error: Error) {
        print(error)
    }
}
