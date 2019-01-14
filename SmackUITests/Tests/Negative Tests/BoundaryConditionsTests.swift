//
//  BoundaryConditionsTests.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class BoundaryConditionsTests: BaseTest {
    
    func testSendAnOversizedMsg() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let channelScreenLoggedIn = loginScreen.loginAUser(email: TestUserStatic1.email, password: TestUserStatic1.password)
        let chatScreenChannelSelected = channelScreenLoggedIn.tapOnChannel(channelName: "general")
        chatScreenChannelSelected.sendAMessage(msgText: randomMessageOversized)
        sleep(3)
        
        // Expected result
        XCTAssert(app.staticTexts["\(randomMessageOversized)"].waitForExistence(timeout: 3), "A message hasn't been sent")
    }
    
    func testLoginBlancAllFields() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        loginScreen.loginBlancAllFields()
        
        // Expected result
        XCTAssert(app.staticTexts["All fields are required to be filled!"].waitForExistence(timeout: 3), "Disclaimer didn't come up")
        
    }
    
    func testLoginBlancEmail() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        loginScreen.loginBlancEmail(password: TestUserStatic1.password)
        
        // Expected result
        XCTAssert(app.staticTexts["All fields are required to be filled!"].waitForExistence(timeout: 3), "Disclaimer didn't come up")
    }
    
    func testLoginBlancPass() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        loginScreen.loginBlancPass(email: TestUserStatic1.email)
        
        // Expected result
        XCTAssert(app.staticTexts["All fields are required to be filled!"].waitForExistence(timeout: 3), "Disclaimer didn't come up")
    }
    
    func testSignUpBlancAllFields() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let singUpScreenWithAvatar = chooseAvatarScreen.chooseAvatar()
        singUpScreenWithAvatar.signUpBlancAllFields()
        
        // Expected result
        XCTAssert(app.staticTexts["All fields are required to be filled!"].waitForExistence(timeout: 3), "Disclaimer didn't come up")
    }
    
    func testSignUpBlancUsername() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let singUpScreenWithAvatar = chooseAvatarScreen.chooseAvatar()
        singUpScreenWithAvatar.signUpBlancUsername(email: TestUserDynamic.email, pass: TestUserDynamic.password)
        
        // Expected result
        XCTAssert(app.staticTexts["All fields are required to be filled!"].waitForExistence(timeout: 3), "Disclaimer didn't come up")
    }
    
    func testSignUpBlancEmail() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let singUpScreenWithAvatar = chooseAvatarScreen.chooseAvatar()
        singUpScreenWithAvatar.signUpBlancEmail(name: TestUserDynamic.username, pass: TestUserDynamic.password)
        
        // Expected result
        XCTAssert(app.staticTexts["All fields are required to be filled!"].waitForExistence(timeout: 3), "Disclaimer didn't come up")
    }
    
    func testSignUpBlancPass() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let loginScreen = channelScreen.tapOnLogin()
        let signUpScreen = loginScreen.tapOnSignUp()
        let chooseAvatarScreen = signUpScreen.tapOnChooseAvatar()
        let singUpScreenWithAvatar = chooseAvatarScreen.chooseAvatar()
        singUpScreenWithAvatar.signUpBlancPass(name: TestUserDynamic.username, email: TestUserDynamic.email)
        
        // Expected result
        XCTAssert(app.staticTexts["All fields are required to be filled!"].waitForExistence(timeout: 3), "Disclaimer didn't come up")
    }
}
