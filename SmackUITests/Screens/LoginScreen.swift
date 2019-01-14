//
//  LoginScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class LoginScreen: BaseScreen {
    
    // XCUIElements
    let loginBtn = app.buttons["Login button"]
    let signupBtn = app.buttons["Sign up button"]
    let emailTxtBox = app.textFields["Email text field"]
    let passTxtBox = app.secureTextFields["Password text field"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func loginAUser(email: String, password: String) -> ChannelScreen {
        emailTxtBox.clear()
        type(email, in: emailTxtBox)
        type(password, in: passTxtBox)
        tap(loginBtn)
        return ChannelScreen()
    }
    
    func loginBlancAllFields(){
        emailTxtBox.clear()
        tap(loginBtn)
    }
    
    func loginBlancEmail(password: String){
        emailTxtBox.clear()
        type(password, in: passTxtBox)
        tap(loginBtn)
    }
    
    func loginBlancPass(email: String){
        emailTxtBox.clear()
        type(email, in: emailTxtBox)
        tap(loginBtn)
    }
    
    func tapOnSignUp() -> SignUpScreen {
        tap(signupBtn)
        return SignUpScreen()
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
