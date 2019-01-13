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
    let avatarCellDark = app.collectionViews.cells.matching(identifier: "Avatar cell").otherElements.containing(.image, identifier:"dark\(avatarIds.randomElement()!.description)").element
    let backBtn = app.buttons["Back button"]
    static let avatarIds = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    override init() {
        super.init()
        isVisible()
    }
    
    func chooseAvatar() -> SignUpScreen{
        tap(avatarCellDark)
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
        XCTAssert(avatarCellDark.waitForExistence(timeout: timeout), "ChooseAvatarSell is not visible")
    }
}

// MARK: - Close Btn Proto
extension ChooseAvatarScreen: CloseProtocol {}
