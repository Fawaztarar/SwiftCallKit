//
//  LiveKitMediaManager.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 31/01/2026.
//


// MARK: - LiveKit Media Manager
//
// Role:
// Concrete MediaManaging implementation backed by LiveKit SDK.
//
// Responsibilities:
// - Connect to a LiveKit room using a token
// - Manage audio/video lifecycle
// - Start and stop local media tracks
//
// Non-responsibilities:
// - No call state decisions
// - No token fetching
// - No UI rendering
// - No navigation
//
import Foundation
import LiveKit


final class LiveKitMediaManager: MediaManaging {

    private let roomManager: LiveKitRoomManaging

    init(roomManager: LiveKitRoomManaging = LiveKitRoomManager()) {
        self.roomManager = roomManager
    }

    func prepareMedia(with token: String) async throws {
        try await roomManager.connect(with: token)
    }

    func startMedia() {
        roomManager.enableMicrophone()
        roomManager.enableCamera()
    }

    func stopMedia() {
        roomManager.disconnect()
    }
}
