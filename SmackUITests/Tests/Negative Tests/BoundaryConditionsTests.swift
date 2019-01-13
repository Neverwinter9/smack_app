//
//  BoundaryConditionsTests.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class BoundaryConditionsTests: BaseTest {
    
    func testSendAnOversizedMsg() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        let chatScreenChannelSelected = channelScreenLoggedIn.tapOnChannel(channelName: "general")
        chatScreenChannelSelected.sendAMessage(msgText: randomMessageOversized)
        sleep(3)
        
        // Expected result
        XCTAssert(app.staticTexts["\(randomMessageOversized)"].waitForExistence(timeout: 3), "A message hasn't been sent")
    }
}
