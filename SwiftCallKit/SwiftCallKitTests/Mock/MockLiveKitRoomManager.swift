//
//  MockLiveKitRoomManager.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation
@testable import SwiftCallKit

final class MockLiveKitRoomManager: LiveKitRoomManaging {
    
    private(set) var didConnect = false
    private(set) var didDisconnect = false
    private(set) var didEnableMicrophone = false
    private(set) var didEnableCamera = false
    
    func connect(with token: String) async throws {
        didConnect = true
    }
    
    func enableMicrophone() {
        didEnableMicrophone = true
    }

    func enableCamera() {
        didEnableCamera = true
    }
    
    func disconnect() {
        didDisconnect = true
    }
    
    
}
