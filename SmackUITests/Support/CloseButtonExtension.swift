//
//  CloseButtonExtension.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import Foundation

protocol CloseProtocol {
    func tapOnCloseButton() -> ChannelScreen
}

extension CloseProtocol {
    func tapOnCloseButton() -> ChannelScreen {
        let closeBtn = BaseScreen.app.buttons["Close button"]
        closeBtn.tap()
        return ChannelScreen()
    }
}
