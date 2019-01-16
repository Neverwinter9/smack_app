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
    let randomMessage = RandomStringGenerator.init().randomString(length: 10)
    let randomMessageOversized = RandomStringGenerator.init().randomString(length: 100)
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["deleteAllData"]
        app.launch()
    }
    
    // Date() re-formatter
    func timeStampFormatter(currentTime: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        let formattedDateTime = formatter.string(from: currentTime)
        return formattedDateTime
    }
}
