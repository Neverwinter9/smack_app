//
//  TestChannel.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/12/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import Foundation

struct TestChannel {
    static let channelName = "randomChannel_\(channelIndex.randomElement()!.description)"
    static let channelIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    static let channelDesc = "this is a test channel"
}
