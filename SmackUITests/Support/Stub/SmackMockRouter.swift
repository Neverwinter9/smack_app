//
//  SmackMockRouter.swift
//  SmackUITests
//
//  Created by Pavel Ponomarev on 1/10/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import XCTest
import EnvoyAmbassador
import Embassy

class OrderMeRouter: Router {
    static let findUser = "/user/byEmail/"
    
    override init() {
        super.init()
    }
}
