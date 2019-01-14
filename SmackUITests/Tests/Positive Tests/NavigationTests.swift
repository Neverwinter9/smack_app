//
//  NavigationTests.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/13/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class NavigationTests: BaseTest {
    
    func testCloseLoginScreen() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoginClosed = loginScreen.tapOnCloseButton()
        
        // Expected result
        XCTAssert(channelScreenLoginClosed.addChannelBtn.waitForExistence(timeout: timeout), "Close Login screen segue failed")
    }
    
    func testCloseSignUpScreen() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let channelScreenSignUpClosed = signUpScreen.tapOnCloseButton()
        
        // Expected result
        XCTAssert(channelScreenSignUpClosed.addChannelBtn.waitForExistence(timeout: timeout), "Close SignUp screen segue failed")
    }
    
    func testCloseCreateAChannelScreen() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        let createChannelScreen = channelScreenLoggedIn.tapOnAddChannel()
        let channelScreenCreateAChannelClosed = createChannelScreen.tapOnCloseButton()
        
        // Expected result
        XCTAssert(channelScreenCreateAChannelClosed.addChannelBtn.waitForExistence(timeout: timeout), "Close CreateAChannel screen segue failed")
    }
    
    func testCloseProfileScreen() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic.email, password: TestUserStatic.password)
        let profileScreen = channelScreenLoggedIn.tapOnProfile()
        let channelScreenProfileClosed = profileScreen.tapOnCloseButton()
        
        // Expected result
        XCTAssert(channelScreenProfileClosed.addChannelBtn.waitForExistence(timeout: timeout), "Close Profile screen segue failed")
    }
    
    func testBackFromAvatarPicker() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let signUpScreenBackFromAvatarPicker = chooseAvatarScreen.tapOnBackBtn()
            
        // Expected result
        XCTAssert(signUpScreenBackFromAvatarPicker.createAcntBtn.waitForExistence(timeout: timeout), "Close Profile screen segue failed")
    }
}
