//
//  UserIsNotLoggedInTests.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/10/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class UserIsNotLoggedInTests: BaseTest {
    
    func testMessageIsNotVisible() {
        
        // Test steps
        let chatScreen = ChatScreen()
        
        // Expected result
        XCTAssertFalse(chatScreen.messageCell.exists, "Message is shown when it shouldn't")
    }
    
    func testChannelIsNotVisible() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        
        // Expected result
        XCTAssertFalse(channelScreen.channelCell.exists, "Channel is shown when it shouldn't")
    }
    
    func testSendBtnIsHidden() {

        // Test steps
        let chatScreen = ChatScreen()
        chatScreen.sendBtnIsHidden()
        
        // Expected result
        XCTAssertFalse(chatScreen.sendBtn.exists, "SendBtn is shown when it shouldn't")
    }
    
    func testAddChannelBtnIsDisabled() {
        
        // Test steps
        let chatScreen = ChatScreen()
        let channelScreen = chatScreen.navigateToChannelScreen()
        let createChannelScreen = channelScreen.tapOnAddChannel()
        
        // Expected result
        XCTAssertFalse(createChannelScreen.createChannelBtn.exists, "CreateChannelScreen is shown when it shouldn't")
    }
    
    
    
    
}
