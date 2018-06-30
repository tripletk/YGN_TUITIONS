//
//  ServerCommunicator.swift
//  YGN_Tuitions
//
//  Created by Safal Aryal on 30/06/2018.
//  Copyright © 2018 Timmy Tseng. All rights reserved.
//

import Foundation

let max: UInt32 = 4096

var input: InputStream!
var output: OutputStream!

func serverInit(address: String, port: UInt32) {
    var readStream: Unmanaged<CFReadStream>?
    var writeStream: Unmanaged<CFWriteStream>?
    
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, address as CFString, port, &readStream, &writeStream)
    
    input = readStream!.takeRetainedValue()
    output = writeStream!.takeRetainedValue()
    
    input.schedule(in: .current, forMode: .commonModes)
    output.schedule(in: .current, forMode: .commonModes)
    
    input.open()
    output.open()
}

func serverLogin(username: String, password: String) -> Bool {
    let request = "login \(username) \(password)".data(using: .ascii)!
    _ = request.withUnsafeBytes{  output.write($0, maxLength: request.count)}
    let response = UnsafeMutablePointer<UInt8>.allocate(capacity: 64)
    input.read(response, maxLength: 64)
    let resStr = String(cString: response)
    print(resStr)
    return resStr == "LoginComplete"
}

func serverRegister(username: String, email: String, password: String, isTeacher: Bool) -> Bool {
    let request = "register \(username) \(email) \(password) \(isTeacher)".data(using: .ascii)!
    _ = request.withUnsafeBytes{ output.write($0, maxLength: request.count)}
    let response = UnsafeMutablePointer<UInt8>.allocate(capacity: 64)
    input.read(response, maxLength: 64)
    let resStr = String(cString: response)
    print(resStr)
    return resStr == "RegisterComplete"
}
