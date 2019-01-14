//
//  ChannelTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class ChannelTests: BaseTest {
    
    func testCreateAChannel() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic1.email, password: TestUserStatic1.password)
        let createChannelScreen = channelScreenLoggedIn.tapOnAddChannel()
        _ = createChannelScreen.createNewChannel(channelName: TestChannel.channelName, channelDesc: TestChannel.channelDesc)
        
        print(app.descendants(matching: .any).debugDescription)
        
        // Expected result
        XCTAssert(app.staticTexts["#\(TestChannel.channelName)"].exists, "A channel hasn't been created")
    }
    
    func testSelectAChannel() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic1.email, password: TestUserStatic1.password)
        _ = channelScreenLoggedIn.tapOnChannel(channelName: "general")
        
        // Expected result
        XCTAssert(app.staticTexts["#general"].exists, "A channel hasn't been selected")
    }
}
