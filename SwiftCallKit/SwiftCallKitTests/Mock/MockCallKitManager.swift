//
//  MockCallKitManager.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation
@testable import SwiftCallKit

final class MockCallKitManager: CallKitManaging {

    private(set) var didStartOutgoingCall = false
    private(set) var didReportIncomingCall = false
    private(set) var didEndCall = false

    func startOutgoingCall() {
        didStartOutgoingCall = true
    }

    func reportIncomingCall() {
        didReportIncomingCall = true
    }

    func endCall() {
        didEndCall = true
    }
}
