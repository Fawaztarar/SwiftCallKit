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

    func prepareMedia() {
        didPrepareMedia = true
    }

    func startMedia() {
        didStartMedia = true
    }

    func stopMedia() {
        didStopMedia = true
    }
}
