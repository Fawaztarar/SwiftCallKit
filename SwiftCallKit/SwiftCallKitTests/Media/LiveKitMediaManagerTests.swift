//
//  LiveKitMediaManagerTests.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 02/02/2026.
//

import Foundation
import XCTest
@testable import SwiftCallKit

final class LiveKitMediaManagerTests: XCTestCase {
    
    func test_prepareMedia_connectRoom() async throws {
        
        // ARRANGE
        let mockRoomManager = MockLiveKitRoomManager()
        
        let mediaManager = await MainActor.run {
            LiveKitMediaManager(roomManager: mockRoomManager)
        }
        
        // ACT
        try await mediaManager.prepareMedia(with: "test-token")

        
        // ASSERT
        XCTAssert(mockRoomManager.didConnect)
        
    }
    
    
    
    
    
    func test_startMedia_enablesMicrophoneAndCamera() async {

        // ARRANGE
        let mockRoomManager = MockLiveKitRoomManager()
        
        let mediaManager = await MainActor.run {
               LiveKitMediaManager(roomManager: mockRoomManager)
           }

        // ACT
        await MainActor.run {
             mediaManager.startMedia()
         }

        // ASSERT
        XCTAssertTrue(mockRoomManager.didEnableMicrophone)
        XCTAssertTrue(mockRoomManager.didEnableCamera)
    }

    
    func test_stopMedia_disConnectRoom() async {
        
        // ARRANGE
        let mockRoomManager = MockLiveKitRoomManager()
        
        let mediaManager = await MainActor.run {
               LiveKitMediaManager(roomManager: mockRoomManager)
           }

        // ACT
        await MainActor.run {
             mediaManager.stopMedia()
         }

        // ASSERT
        XCTAssert(mockRoomManager.didDisconnect)
    

        
    }
    
}
