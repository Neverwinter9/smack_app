//
//  SignUpTest.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/10/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class SignUpTest: BaseTest {
    
    func testSignUp() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let singUpScreenWithAvatar = chooseAvatarScreen.chooseAvatar()
        let channelScreenLoggedIn = singUpScreenWithAvatar.createAnAccount(name: TestUserDynamic.username, email: TestUserDynamic.email, pass: TestUserDynamic.password)
        //let profileScreen = channelScreenLoggedIn.tapOnProfile()
        
        // Expected result
        // XCTAssertTrue(profileScreen.logoutBtn.waitForExistence(timeout: timeout), "User account isn't created")
        XCTAssertTrue(channelScreenLoggedIn.isLoggedIn(label: TestUserDynamic.username), "User is still logged in")
    }
}
