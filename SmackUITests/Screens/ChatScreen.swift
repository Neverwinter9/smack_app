//
//  ChatScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/8/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class ChatScreen: BaseScreen {
    
    // XCUIElements
    let overflowMenuBtn = app.buttons["Overflow menu button"]
    let messageTxtFiled = app.textFields["Message text field"]
    let sendBtn = app.buttons["Send button"]
    let messageCell = app.cells["Message cell"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func navigateToChannelScreen() -> ChannelScreen {
        tap(overflowMenuBtn)
        return ChannelScreen()
    }
    
    func navigateToChannelScreenBySwipe() -> ChannelScreen {
        swipeRight(messageTxtFiled)
        return ChannelScreen()
    }
    
    func sendAMessage(msgText: String) {
        messageTxtFiled.clear()
        type(msgText, in: messageTxtFiled)
        tap(sendBtn)
    }
    
    func sendBtnIsHidden() {
        messageTxtFiled.clear()
        type("some text", in: messageTxtFiled)
        tapCoordinate(at: 50, and: 50)
    }
}

// MARK: - Visibility
extension ChatScreen {
    private func isVisible() {
        XCTAssert(messageTxtFiled.waitForExistence(timeout: timeout), "ChatScreen is not visible")
    }
}
