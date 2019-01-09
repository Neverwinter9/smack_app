//
//  SmackUITests.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/8/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest

class BaseScreen {
    
    static let app = XCUIApplication()
    let timeout: TimeInterval = 5
    
    // Gestures
    func tap(_ element: XCUIElement) {
        element.tap()
    }
    
    func swipeDown(_ element: XCUIElement) {
        element.swipeDown()
    }
    
    func swipeUp(_ element: XCUIElement) {
        element.swipeUp()
    }
    
    func swipeRight(_ element: XCUIElement) {
        element.swipeRight()
    }
    
    func swipeLeft(_ element: XCUIElement) {
        element.swipeLeft()
    }
    
    func type(_ text: String, in element: XCUIElement) {
        element.tap()
        element.typeText(text)
    }
}
