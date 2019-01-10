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
        
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreen2 = loginScreen.loginAUser(email: TestUser.email, password: TestUser.password)
        XCTAssertTrue(channelScreen2.isLoggedIn(label: TestUser.username), "User isn't logged in")
    }
}
