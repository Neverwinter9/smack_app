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
    
    override init() {
        super.init()
        isVisible()
    }
    
    func logoutAUser() -> ChannelScreen{
        tap(logoutBtn)
        return ChannelScreen()
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
