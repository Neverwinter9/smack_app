//
//  LoginTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class LoginTest: BaseTest {
    
    func testLoginAUser() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        
        // Expected result
        XCTAssertTrue(channelScreenLoggedIn.isLoggedIn(label: TestUserStatic.username), "User isn't logged in")
    }
}
