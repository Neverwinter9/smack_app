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

    // All services must be singletons!
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    // Old way (doesn't work anymore)
    //var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    // New way
    let manager = SocketManager(socketURL: URL(string: "\(BASE_URL)")!) // Creating a SocketManager
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
            
            // Instantiating received channel object and passing it to the MessageService's array of channels ([Channel])
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    // Sending new message (client request)
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    // Listening for server response (Message created)
    func getChatMessage(completion: @escaping (_ newMessage: Message) -> Void) {
        socket.on("messageCreated") { (dataArray, ack) in
            guard let msgBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let messageId = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
            
            // Instantiating received message object and passing it to the MessageService's array of messages ([Message]) / For a selected channel only
            let newMessage = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: messageId, timeStamp: timeStamp)
            
            completion(newMessage)
        }
    }
    
    // Listening for server response (User is typing)
    // New completion handler: (_ typingUsers: [String: String]) -> Void)
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
        socket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else { return }
            completionHandler(typingUsers)
        }
    }
}
