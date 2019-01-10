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
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["deleteAllData"]
        app.launch()
    }
}
