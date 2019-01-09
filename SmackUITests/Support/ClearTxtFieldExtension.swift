//
//  ClearTxtFieldExtension.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/9/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

extension XCUIElement {
    func clear() {
        guard elementType == .textField || elementType == .secureTextField else {
            XCTFail("Applied clear function for a wrong type")
            return
        }
        tap()
        let deleteChar = XCUIKeyboardKey.delete.rawValue
        let deleteStr = String(repeating: deleteChar, count: 30)
        typeText(deleteStr)
    }
}
