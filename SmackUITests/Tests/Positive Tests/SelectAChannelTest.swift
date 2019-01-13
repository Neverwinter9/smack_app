//
//  SelectAChannelTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class SelectAChannelTest: BaseTest {
    
    func testSelectAChannel() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        let chatScreenChannelSelected = channelScreenLoggedIn.tapOnChannel(channelName: "general")
        
        // Expected result
        XCTAssert(app.staticTexts["#general"].exists, "A channel hasn't been selected")
    }
}
