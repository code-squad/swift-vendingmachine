//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

enum Mode {
    case administrator
    case user
    case quit
}

func main() {
    
    while true {
        do{
            OutputView.startMessage()
            let mode = try InputView.selectMode()
        } catch let error as InputView.Error {
            print(error.errorMessage)
            continue
        } catch {
            fatalError("unexpected error")
            return
        }
    }
}

main()
