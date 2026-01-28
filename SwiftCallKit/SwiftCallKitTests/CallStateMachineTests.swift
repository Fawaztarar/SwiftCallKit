//
//  CallStateMachineTests.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import Foundation
import XCTest
@testable import SwiftCallKit



// MARK: - CallStateMachine Tests

final class CallStateMachineTests: XCTestCase {

    // MARK: - Incoming Call Flow

    func testIncomingCallAcceptedTransitionsToConnecting() {

        // MARK: Arrange
        let machine = CallStateMachine()

        // MARK: Act
        let newState = machine.transition(
            from: .ringing,
            event: .accept
        )

        // MARK: Assert
        XCTAssertEqual(newState, .connecting)
    }

    // MARK: - Call Ending Behaviour

    func testCallEndsFromAnyState() {

        // MARK: Arrange
        let machine = CallStateMachine()
        let states: [CallState] = [
            .idle, .ringing, .connecting, .active
        ]

        // MARK: Act & Assert
        for state in states {
            let result = machine.transition(
                from: state,
                event: .end(reason: .localHangUp)
            )

            XCTAssertEqual(result, .ended(reason: .localHangUp))
        }
    }
}
