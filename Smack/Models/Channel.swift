//
//  Channel.swift
//  Smack
//
//  Created by Pavel Ponomarev on 1/2/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import Foundation


struct Channel {
    
    // vars to use them in classic JSON parser
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
    
    //vars to use them in updated(Swift 4 style) JSON parser; they should conform with Decodable proto == titles should mirror JSON response items
    //    public private(set) var _id: String!
    //    public private(set) var description: String!
    //    public private(set) var name: String!
    //    public private(set) var __v: Int?
}
