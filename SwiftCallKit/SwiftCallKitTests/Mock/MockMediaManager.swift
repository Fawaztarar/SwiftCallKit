//
//  MockMediaManager.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation
@testable import SwiftCallKit

final class MockMediaManager: MediaManaging {

    private(set) var didPrepareMedia = false
    private(set) var didStartMedia = false
    private(set) var didStopMedia = false
    private(set) var receivedToken: String?
    
    func prepareMedia(with token: String) async throws {
           didPrepareMedia = true
           receivedToken = token
       }

//    func prepareMedia(with token: String) {
//           didPrepareMedia = true
//           receivedToken = token
//       }

    func startMedia() {
        didStartMedia = true
    }

    func stopMedia() {
        didStopMedia = true
    }
}
