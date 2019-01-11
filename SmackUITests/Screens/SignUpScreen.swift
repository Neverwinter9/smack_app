//
//  SignUpScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class SignUpScreen: BaseScreen {
    
    // XCUIElements
    let userNameTxtBox = app.textFields["Username text field"]
    let emailTxtBox = app.textFields["Email text field"]
    let passTxtBox = app.secureTextFields["Password text field"]
    let chooseAvatarBtn = app.buttons["Choose avatar button"]
    let genBackgroundColorBtn = app.buttons["Generate background color button"]
    let createAcntBtn = app.buttons["Create account button"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func tapOnChooseAvatar() -> ChooseAvatarScreen {
        tap(chooseAvatarBtn)
        return ChooseAvatarScreen()
    }
    
    func createAnAccount() -> ChannelScreen{
        tap(genBackgroundColorBtn)
        userNameTxtBox.clear()
        emailTxtBox.clear()
        type(randomString(length: 5), in: userNameTxtBox)
        type(randomString(length: 5), in: emailTxtBox)
        type(randomString(length: 5), in: passTxtBox)
        tapCoordinate(at: 20, and: 20)
        tap(createAcntBtn)
        return ChannelScreen()
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
}

// MARK: - Visibility
extension SignUpScreen {
    private func isVisible() {
        XCTAssert(createAcntBtn.waitForExistence(timeout: timeout), "SignUpScreen is not visible")
    }
}

// MARK: - Close Btn Proto
extension LoginScreen: CloseProtocol {}
