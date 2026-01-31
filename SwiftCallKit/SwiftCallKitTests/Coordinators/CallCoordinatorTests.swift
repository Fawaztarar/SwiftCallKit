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
            let mediaManager = MockMediaManager()
            
            let coordinator = CallCoordinator(
                callKitManager: callKitManager,
                mediaManager: mediaManager
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
            let mediaManager = MockMediaManager()
            let coordinator = CallCoordinator(
                callKitManager: callKitManager,
                mediaManager: mediaManager
            )
            // ACT
            coordinator.callStateDidChange(to: CallState.ringing)

            // ASSERT
            XCTAssertTrue(callKitManager.didReportIncomingCall)
        }
    }
    
    func test_endedState_endsSystemCall() async {
        await MainActor.run {
            // ARRANGE
            let callKitManager = MockCallKitManager()
            let mediaManager = MockMediaManager()
            let coordinator = CallCoordinator(
                callKitManager: callKitManager,
                mediaManager: mediaManager
            )

            // ACT
            coordinator.callStateDidChange(
                to: CallState.ended(reason: .localHangUp)
            )

            // ASSERT
            XCTAssertTrue(callKitManager.didEndCall)
        }
    }
    
    func test_connectingState_preparesMedia() async {
        await MainActor.run {
            // ARRANGE
            let callKitManager = MockCallKitManager()
            let mediaManager = MockMediaManager()

            let coordinator = CallCoordinator(
                callKitManager: callKitManager,
                mediaManager: mediaManager
            )

            // ACT
            coordinator.callStateDidChange(to: CallState.connecting)

            // ASSERT
            XCTAssertTrue(mediaManager.didPrepareMedia)
        }
    }
    

    func test_activeState_startMedia() async {
        await MainActor.run {
            // ARRANGE
            let callKitManager = MockCallKitManager()
            let mediaManager = MockMediaManager()

            let coordinator = CallCoordinator(
                callKitManager: callKitManager,
                mediaManager: mediaManager
            )

            // ACT
            coordinator.callStateDidChange(to: CallState.active)

            // ASSERT
            XCTAssertTrue(mediaManager.didStartMedia)
        }
    }
    
    func test_endedState_sopMedia() async {
        await MainActor.run {
            // ARRANGE
            let callKitManager = MockCallKitManager()
            let mediaManager = MockMediaManager()

            let coordinator = CallCoordinator(
                callKitManager: callKitManager,
                mediaManager: mediaManager
            )

            // ACT
            coordinator.callStateDidChange(to: CallState.ended(reason: .localHangUp))

            // ASSERT
            XCTAssertTrue(mediaManager.didStopMedia)
        }
    }


}

