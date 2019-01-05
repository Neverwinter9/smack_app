//
//  SocketService.swift
//  Smack
//
//  Created by Pavel Ponomarev on 1/4/19.
//  Copyright © 2019 Pavel Ponomarev. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    // All services must be singletons
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    // Old way (doesn't work anymore)
    //var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    // New way
    let manager = SocketManager(socketURL: URL(string: "\(BASE_URL)")!) // Creating the SocketManager
    lazy var socket: SocketIOClient = manager.defaultSocket // Instantiating the socket
    
    
    // Connect to the server
    func establishConnection() {
        socket.connect()
    }
    
    // Disconnect from the server
    func closeConnection() {
        socket.disconnect()
    }
    
    // Adding new channel (client request)
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    // Listening for server response (Channel created)
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            // Instantiating received channel object and passing it to the MessageService's array of channels
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}
