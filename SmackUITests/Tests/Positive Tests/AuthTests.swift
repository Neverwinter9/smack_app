//
//  AuthTests.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class AuthTests: BaseTest {
    
    func testLoginAUser() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic1.email, password: TestUserStatic1.password)
        
        // Expected result
        XCTAssertTrue(channelScreenLoggedIn.isLoggedIn(label: TestUserStatic1.username), "User isn't logged in")
        // testing
    }
    
    func testLogoutUser() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic1.email, password: TestUserStatic1.password)
        let profileScreen = channelScreenLoggedIn.tapOnProfile()
        let channelScreenLoggedOut = profileScreen.tapOnLogout()
        
        // Expected result
        XCTAssertFalse(channelScreenLoggedOut.isLoggedIn(label: TestUserStatic1.username), "User is still logged in")
    }
    
    func testSignUp() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let singUpScreenWithAvatar = chooseAvatarScreen.chooseAvatar()
        let channelScreenLoggedIn = singUpScreenWithAvatar.createAnAccount(name: TestUserDynamic.username, email: TestUserDynamic.email, pass: TestUserDynamic.password)
        
        // Expected result
        // XCTAssertTrue(profileScreen.logoutBtn.waitForExistence(timeout: timeout), "User account isn't created")
        XCTAssertTrue(channelScreenLoggedIn.isLoggedIn(label: TestUserDynamic.username), "User is still logged in")
    }
    
    func testChangeAUsername() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic2.email, password: TestUserStatic2.password)
        let profileScreen = channelScreenLoggedIn.tapOnProfile()
        let editUsernameScreen = profileScreen.tapOnEditUsername()
        let profileScreenEdited = editUsernameScreen.editUsername(newUsername: TestUserDynamic.username)
        let channelScreenEdited = profileScreenEdited.tapOnCloseButton()
        
        XCTAssertTrue(channelScreenEdited.isLoggedIn(label: TestUserDynamic.username), "Failed to edit username")
    }
}
