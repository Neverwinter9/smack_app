//
//  ProfileScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class ProfileScreen: BaseScreen {
    
    // XCUIElements
    let logoutBtn = app.buttons["Logout button"]
    let editUsernameBtn = app.buttons["Edit username button"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func tapOnLogout() -> ChannelScreen{
        tap(logoutBtn)
        return ChannelScreen()
    }
    
    func tapOnEditUsername() -> EditUsernameScreen {
        tap(editUsernameBtn)
        return EditUsernameScreen()
    }
}

// MARK: - Visibility
extension ProfileScreen {
    private func isVisible() {
        XCTAssert(logoutBtn.waitForExistence(timeout: timeout), "ProfileScreen is not visible")
    }
}

// MARK: - Close Btn Proto
extension ProfileScreen: CloseProtocol {}
