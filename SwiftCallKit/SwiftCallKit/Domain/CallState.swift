//
//  CallState.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import Foundation

enum CallState: Equatable {
    case idle
    case calling          // outgoing call initiated
    case ringing          // incoming call
    case connecting       // media / signalling handshake
    case active
    case ended(reason: EndReason)
}


enum EndReason: Equatable {
    case localHangUp
    case remoteHangUp
    case failed
    case declined
}



// MARK: - Equality Behaviour
// Swift 6 enforces strict actor isolation rules.
// The compiler may infer `Equatable` conformances as actor-isolated
// depending on where the type is used (e.g. @MainActor ViewModels).
//
// We explicitly provide a `nonisolated` implementation of `==`
// to guarantee that CallState equality is:
// - Pure (no side effects)
// - Thread-safe
// - Safe to use from tests, Domain logic, and SwiftUI
//
// This keeps the Domain layer free from actor annotations
// while remaining compatible with Swift 6 concurrency rules.


extension CallState {
    nonisolated static func == (lhs: CallState, rhs: CallState) -> Bool {
        switch (lhs, rhs) {

        case (.idle, .idle),
             (.calling, .calling),
             (.ringing, .ringing),
             (.connecting, .connecting),
             (.active, .active):
            return true

        case let (.ended(lReason), .ended(rReason)):
            return lReason == rReason

        default:
            return false
        }
    }
}


extension EndReason {
    nonisolated static func == (lhs: EndReason, rhs: EndReason) -> Bool {
        switch (lhs, rhs) {
        case (.localHangUp, .localHangUp),
             (.remoteHangUp, .remoteHangUp),
             (.failed, .failed),
             (.declined, .declined):
            return true
        default:
            return false
        }
    }
}
