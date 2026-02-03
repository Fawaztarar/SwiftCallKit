//
//  LiveKitRoomManager.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation
import LiveKit


final class LiveKitRoomManager: LiveKitRoomManaging {


    

    private let room: Room

    init(room: Room = Room()) {
        self.room = room
    }

    func connect(with token: String) async throws {
        try await room.connect(
            url: LiveKitConfig.serverURL.absoluteString,
            token: token
        )
    }
    
    
    
    func enableMicrophone() {
        Task {
            try? await room.localParticipant.setMicrophone(enabled: true)
        }
    }

    func enableCamera() {
        Task {
            try? await room.localParticipant.setCamera(enabled: true)
        }
    }

    


    func disconnect() {
        Task {
            await room.disconnect()
        }
    }

}
