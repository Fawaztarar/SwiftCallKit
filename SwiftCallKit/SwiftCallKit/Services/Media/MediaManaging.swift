//
//  MediaManaging.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation
protocol MediaManaging {

    // Prepare media resources (audio/video, permissions, engine setup)
    // Called when a call is transitioning into a connecting state
    func prepareMedia(with token: String)

    // Start media streaming once the call is fully active
    func startMedia()

    // Stop and clean up all media resources
    func stopMedia()
}
