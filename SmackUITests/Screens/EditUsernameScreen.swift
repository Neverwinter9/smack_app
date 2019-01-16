//
//  EditUsernameScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/15/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class EditUsernameScreen: BaseScreen {
    
    // XCUIElements
    let editUsernameTxtFiled = app.textFields["Edit username text field"]
    let editUsernameBtn = app.buttons["Confirm new username button"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func editUsername(newUsername: String) -> ProfileScreen{
        editUsernameTxtFiled.clear()
        type(newUsername, in: editUsernameTxtFiled)
        tap(editUsernameBtn)
        return ProfileScreen()
    }
    
    func editUsernameBlank(){
        editUsernameTxtFiled.clear()
        tap(editUsernameBtn)
    }
}

// MARK: - Visibility
extension EditUsernameScreen {
    private func isVisible() {
        XCTAssert(editUsernameBtn.waitForExistence(timeout: timeout), "ProfileScreen is not visible")
    }
}

// MARK: - Close Btn Proto
extension EditUsernameScreen: CloseProtocol {}
