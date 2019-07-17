//
//  TTTSocketWrapper.swift
//  tic-tac-toe
//
//  Created by SUP'Internet 02 on 26/06/2019.
//  Copyright © 2019 SUPINT_12. All rights reserved.
//

import Foundation
import SocketIO

class TTTSocketWrapper{
    static let shared = TTTSocketWrapper()
    
    var socket:SocketIOClient
    
    init() {
        self.socket = SocketIOClient(socketURL: URL(string: "http://51.254.112.146:5666/")!, config: [.log(true), .compress])
    }
    
    func connect(){
        self.socket.connect()
    }
    
    func disconnect(){
        self.socket.disconnect()
    }
}
