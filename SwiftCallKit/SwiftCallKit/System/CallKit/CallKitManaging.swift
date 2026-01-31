//
//  CallKitManaging.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation


// MARK: - CallKit Managing
//
// Role:
// Responsible for interacting with the iOS system call infrastructure.
//
// Responsibilities:
// - Start an outgoing system call
// - Report an incoming system call
// - End a system call
//
// Non-responsibilities:
// - No call state decisions
// - No media handling
// - No UI navigation


// MARK: - CallKit Managing

protocol CallKitManaging {

    // Start an outgoing system call
    func startOutgoingCall()

    // Report an incoming system call
    func reportIncomingCall()

    // End the current system call
    func endCall()
}
