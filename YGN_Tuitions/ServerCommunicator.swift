//
//  ServerCommunicator.swift
//  YGN_Tuitions
//
//  Created by Safal Aryal on 01/07/2018.
//  Copyright © 2018 Timmy Tseng. All rights reserved.
//

import Foundation
import SwiftSocket

var client: TCPClient?

func connectToServer(host: String, port: Int32) -> Bool {
    client = TCPClient(address: host, port: port)
    switch client?.connect(timeout: 20) {
    case .success?:
        return true
    case .failure(let error)?:
        print(error)
        return false
    case .none:
        return false
    }
}

func login(username: String, password: String) -> Bool {
    let request: Data = "login \"\(username)\" \"\(password)\"".data(using: .ascii)!
    _ = client?.send(data: request)
    let response = client?.read(64)
    let resultStr = String(bytes: response!, encoding: .ascii)
    return resultStr == "LoginComplete"
}

func register(username: String, password: String, email: String, isTeacher: Bool, township: String, subject: String) -> Bool {
    let request: Data = "register \"\(username)\" \"\(password)\" \(email) \(isTeacher) \"\(township)\" \"\(subject)\" ".data(using: .ascii)!
    _ = client?.send(data: request)
    let response = client?.read(64)
    let resultStr = String(bytes: response!, encoding: .ascii)
    return resultStr == "RegisterComplete"
}

func review(teacherUsername: String, studentUsername: String, review: String) -> Bool {
    return true
}

func retrieve(teacherUsername: String, studentUsername: String) -> String {
    return ""
}
