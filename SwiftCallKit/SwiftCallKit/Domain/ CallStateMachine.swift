//
//   CallStateMachine.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import Foundation
struct CallStateMachine {

    func transition(
        from current: CallState,
        event: CallEvent
    ) -> CallState {

        switch (current, event) {

        // Outgoing call flow
        case (.idle, .startOutgoing):
            return .calling

        case (.calling, .connected):
            return .connecting

        // Incoming call flow
        case (.idle, .receiveIncoming):
            return .ringing

        case (.ringing, .accept):
            return .connecting

        // Common flow
        case (.connecting, .connected):
            return .active

        case (_, .end(let reason)):
            return .ended(reason: reason)

        default:
            return current
        }
    }
}
