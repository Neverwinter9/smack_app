//
//  CreateAChannelTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class CreateAChannelTest: BaseTest {
    
    func testCreateAChannel() {
        
        // Not scalable yet; needs refactor
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        let createChannelScreen = channelScreenLoggedIn.tapOnAddChannel()
        let channelScreenNewChannelAdded = createChannelScreen.createNewChannel(channelName: TestChannel.channelName, channelDesc: TestChannel.channelDesc)
        
        
        print(app.descendants(matching: .any).debugDescription)
        
        // Expected result
        XCTAssert(app.staticTexts["#\(TestChannel.channelName)"].exists, "A channel hasn't been created")
    }
}
