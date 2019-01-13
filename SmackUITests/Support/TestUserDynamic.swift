//
//  TestUserDynamic.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import Foundation

struct TestUserDynamic {
    static let username = "TestUser_\(randIndex.randomElement()!.description)"
    static let email = "random@user_\(randIndex.randomElement()!.description).com"
    static let randIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    static let password = "12345"
}
