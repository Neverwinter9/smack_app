//
//  CreateChannelScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class CreateChannelScreen: BaseScreen {
    
    // XCUIElements
    let nameTxtField = app.textFields["Channel name text field"]
    let descTxtField = app.textFields["Channel description text field"]
    let createChannelBtn = app.buttons["Create channel button"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func createNewChannel() -> ChannelScreen{
        nameTxtField.clear()
        type("test", in: nameTxtField)
        type("", in: descTxtField)
        tap(createChannelBtn)
        return ChannelScreen()
    }
}

// MARK: - Visibility
extension CreateChannelScreen {
    private func isVisible() {
        XCTAssert(createChannelBtn.waitForExistence(timeout: timeout), "CreateChannelScreen is not visible")
    }
}

// MARK: - Close Btn Proto
extension CreateChannelScreen: CloseProtocol {}
