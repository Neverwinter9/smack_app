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
    let addChannelBtn = app/*@START_MENU_TOKEN@*/.buttons["Add channel button"]/*[[".buttons[\"addChannelButton\"]",".buttons[\"Add channel button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    let channelCell = app.cells["Channel cell"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func tapOnLogin() -> LoginScreen {
        tap(loginBtn)
        return LoginScreen()
    }
    
    func tapOnAddChannel() {
        tap(addChannelBtn)
    }
    
    func tapOnChannel() -> ChatScreen {
        tap(channelCell)
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
