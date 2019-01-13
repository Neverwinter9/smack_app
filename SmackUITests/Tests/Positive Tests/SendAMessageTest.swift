//
//  SendAMessageTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class SendAMessageTest: BaseTest {
    
    func testSendAMessage() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        let chatScreenChannelSelected = channelScreenLoggedIn.tapOnChannel(channelName: "general")
        chatScreenChannelSelected.sendAMessage(msgText: randomMessage)
        
        // Expected result
        XCTAssert(app.staticTexts["\(randomMessage)"].waitForExistence(timeout: timeout), "A message hasn't been sent")
    }
}
