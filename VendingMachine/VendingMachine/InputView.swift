//
//  InputView.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 14..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    enum Error: Swift.Error {
        case modeSelectError
        
        var errorMessage: String {
            switch self {
            case.modeSelectError:
                return "올바른 모드를 선택해주세요."
            }
        }
    }
    
    static func selectMenu() -> (Int, Int) {
        let input = (readLine() ?? "").split(separator: " ").compactMap { Int($0) }
        return (input.first!, input.last!)
    }
    
    static func readCoin() -> Int {
        return Int(readLine()!) ?? 0
    }
    
    static func selectMode() throws -> Mode {
        while true {
            let input = readLine() ?? ""
            switch input {
            case "1":
                return .administrator
            case "2":
                return .user
            case "q":
                return .quit
            default:
                throw Error.modeSelectError
            }
        }
    }
}
