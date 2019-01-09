//
//  ChatScreen.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/8/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class ChatScreen: BaseScreen {
    
    let overflowMenuBtn = app.buttons["Overflow menu button"]
    let messageTxtFiled = app.textFields["Message text field"]
    let sendBtn = app.buttons["Send button"]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func navigateToChannelScreen() -> ChannelScreen {
        tap(overflowMenuBtn)
        return ChannelScreen()
    }
    
    func sendAMessage() {
        messageTxtFiled.clear()
        type("some text", in: messageTxtFiled)
        tap(sendBtn)
    }
    
}

// MARK: - Visibility

extension ChatScreen {
    private func isVisible() {
        XCTAssert(messageTxtFiled.waitForExistence(timeout: timeout), "ChatScreen is not visible")
    }
}
