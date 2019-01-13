//
//  LogoutTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/11/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class LogoutTest: BaseTest {
    
    func testLogoutUser() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        let profileScreen = channelScreenLoggedIn.tapOnProfile()
        let channelScreenLoggedOut = profileScreen.tapOnLogout()
        
        // Expected result
        XCTAssertFalse(channelScreenLoggedOut.isLoggedIn(label: TestUserStatic.username), "User is still logged in")
    }
}
