//
//  LiveKitRoomManaging.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 31/01/2026.
//


import Foundation


/// Abstraction over a LiveKit room instance.
///
/// Responsibilities:
/// - Establish and tear down a connection to a LiveKit room
/// - Control local media publishing (microphone, camera)
///
/// This protocol exists to:
/// - Isolate the LiveKit SDK from the rest of the app
/// - Enable testability of media orchestration
/// - Enforce a clear boundary between media intent and SDK mechanics
protocol LiveKitRoomManaging {

    /// Connects to a LiveKit room using a valid access token.
    ///
    /// - Parameter token: A server-issued LiveKit access token.
    /// - Throws: An error if the connection fails.
    ///
    /// Concurrency:
    /// - This method is asynchronous and may suspend.
    func connect(with token: String) async throws

    /// Enables the local participant's microphone.
    ///
    /// Expected to be called after a successful room connection.
    func enableMicrophone()

    /// Enables the local participant's camera.
    ///
    /// Expected to be called after a successful room connection.
    func enableCamera()

    /// Disconnects from the LiveKit room and releases underlying resources.
    ///
    /// This method is synchronous by design; implementations may internally
    /// bridge to asynchronous SDK calls.
    func disconnect()
}

