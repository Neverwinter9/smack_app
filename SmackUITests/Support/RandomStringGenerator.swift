//
//  RandomStringExtension.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/10/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import Foundation

//protocol RandomStringExtension {
//    func randomString(length: Int) -> String
//}
//
//extension RandomStringExtension {
//    func randomString(length: Int) -> String {
//        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        return String((0...length-1).map{ _ in letters.randomElement()! })
//    }
//}

class RandomStringGenerator {
    
    init() {
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
}
