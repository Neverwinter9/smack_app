//
//  MessagingTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class MessagingTests: BaseTest {
    
    func testSendAMessage() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic1.email, password: TestUserStatic1.password)
        let chatScreenChannelSelected = channelScreenLoggedIn.tapOnChannel(channelName: "general")
        chatScreenChannelSelected.sendAMessage(msgText: randomMessage)
        
        // Expected result
        XCTAssert(app.staticTexts["\(randomMessage)"].waitForExistence(timeout: timeout), "A message hasn't been sent")
    }
    
    func testCheckFromAnotherAccount() {
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic1.email, password: TestUserStatic1.password)
        let chatScreenChannelSelected = channelScreenLoggedIn.tapOnChannel(channelName: "general")
        chatScreenChannelSelected.sendAMessage(msgText: randomMessage)
        let channelScreenBackFromChat = chatScreenChannelSelected.navigateToChannelScreen()
        let profileScreen = channelScreenBackFromChat.tapOnProfile()
        let channelScreenLoggedOut = profileScreen.tapOnLogout()
        let loginScreen2 = channelScreenLoggedOut.tapOnLogin()
        let channelScreenLoggedIn2 = loginScreen2.loginAUser(email: TestUserStatic2.email, password: TestUserStatic2.password)
        let chatScreenChannelSelected2 = channelScreenLoggedIn2.tapOnChannel(channelName: "general")
        chatScreenChannelSelected2.sendAMessage(msgText: "ping")
        
        // Expected result
        XCTAssert(app.staticTexts["\(randomMessage)"].waitForExistence(timeout: timeout), "A message hasn't been sent")
    }
}
