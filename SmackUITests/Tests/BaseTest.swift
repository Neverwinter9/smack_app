//
//  BaseTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    
    let app = XCUIApplication()
    let timeout: TimeInterval = 3
    let randomMessage = RandomStringExtension.init().randomString(length: 10)
    let randomMessageOversized = RandomStringExtension.init().randomString(length: 200)
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["deleteAllData"]
        app.launch()
    }
}
