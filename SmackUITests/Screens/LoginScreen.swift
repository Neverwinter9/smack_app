//
//  LoginScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class LoginScreen: BaseScreen {
    
    let loginBtn = app.buttons["Login button"]
    let signupBtn = app.buttons["Sigh up button"]
    let emailTxtBox = app.textFields["Email text field"]
    let passTxtBox = app.secureTextFields["Password text field"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func loginAUser() {
        emailTxtBox.clear()
        type(TestUser.email, in: emailTxtBox)
        type(TestUser.password, in: passTxtBox)
        tap(loginBtn)
    }
}

// MARK: - Visibility

extension LoginScreen {
    private func isVisible() {
        XCTAssert(signupBtn.waitForExistence(timeout: timeout), "LoginScreen is not visible")
    }
}

// MARK: - Close Btn Proto
extension LoginScreen: CloseProtocol {}
