//
//  ChooseAvatarScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class ChooseAvatarScreen: BaseScreen {
    
    // XCUIElements
    let avatarCell = app.cells["Avatar cell"]
    let backBtn = app.buttons["Back button"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func chooseAvatar() -> SignUpScreen{
        tap(avatarCell)
        return SignUpScreen()
    }
    
    func tapOnBackBtn() -> SignUpScreen{
        tap(backBtn)
        return SignUpScreen()
    }
}

// MARK: - Visibility
extension ChooseAvatarScreen {
    private func isVisible() {
        XCTAssert(avatarCell.waitForExistence(timeout: timeout), "ChooseAvatarSell is not visible")
    }
}

// MARK: - Close Btn Proto
extension ChooseAvatarScreen: CloseProtocol {}
