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
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let singUpScreen2 = chooseAvatarScreen.chooseAvatar()
        let channelScreen2 = singUpScreen2.createAnAccount()
        let profileScreen = channelScreen2.tapOnProfile()
        XCTAssertTrue(profileScreen.logoutBtn.waitForExistence(timeout: timeout))
    }
}
