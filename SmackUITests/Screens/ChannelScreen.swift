//
//  ChannelScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class ChannelScreen: BaseScreen {
    
    // XCUIElements
    let loginBtn = app.buttons["Login button"]
    let userPic = app.images["User avatar"]
    let addChannelBtn = app/*@START_MENU_TOKEN@*/.buttons["Add channel button"]/*[[".buttons[\"addChannelButton\"]",".buttons[\"Add channel button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    let channelCell = app.cells["Channel cell"]
    let overflowMenuBtn = app.buttons["Overflow menu button"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func navigateToChatScreen() -> ChatScreen {
        tap(overflowMenuBtn)
        return ChatScreen()
    }
    
    func navigateToChatScreenBySwipe() -> ChatScreen {
        swipeLeft(addChannelBtn)
        return ChatScreen()
    }
    
    func tapOnLogin() -> LoginScreen {
        tap(loginBtn)
        return LoginScreen()
    }
    
    func tapOnProfile() -> ProfileScreen {
        tap(loginBtn)
        return ProfileScreen()
    }
    
    func tapOnAddChannel() -> CreateChannelScreen {
        tap(addChannelBtn)
        return CreateChannelScreen()
    }
    
    func tapOnChannel(channelName: String) -> ChatScreen {
        let channel = BaseScreen.app.tables.staticTexts["#\(channelName)"]
        tap(channel)
        return ChatScreen()
    }
    
    func isLoggedIn(label: String) -> Bool {
        if loginBtn.label == label {
            return true
        } else {
            return false
        }
    }
}

// MARK: - Visibility
extension ChannelScreen {
    private func isVisible() {
        XCTAssert(addChannelBtn.waitForExistence(timeout: timeout), "ChannelScreen is not visible")
    }
}
