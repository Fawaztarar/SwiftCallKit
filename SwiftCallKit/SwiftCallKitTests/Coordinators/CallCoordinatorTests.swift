//
//  CallCoordinatorTests.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation
import XCTest
@testable import SwiftCallKit


final class CallCoordinatorTests: XCTestCase {

    func test_callingState_startsOutgoingSystemCall() async {
        await MainActor.run {
            // ARRANGE
            let callKitManager = MockCallKitManager()
            let coordinator = CallCoordinator(
                callKitManager: callKitManager
            )

            // ACT
            coordinator.callStateDidChange(to: CallState.calling)

            // ASSERT
            XCTAssertTrue(callKitManager.didStartOutgoingCall)
        }
    }
    
    func test_ringingState_reportsIncomingSystemCall() async {
        await MainActor.run {
            // ARRANGE
            let callKitManager = MockCallKitManager()
            let coordinator = CallCoordinator(
                callKitManager: callKitManager
            )

            // ACT
            coordinator.callStateDidChange(to: CallState.ringing)

            // ASSERT
            XCTAssertTrue(callKitManager.didReportIncomingCall)
        }
    }

}

