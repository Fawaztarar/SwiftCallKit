//
//  MockCallCoordinator.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation

@testable import SwiftCallKit

final class MockCallCoordinator: CallCoordinating {

    private(set) var receivedStates: [CallState] = []

    func callStateDidChange(to state: CallState) {
        receivedStates.append(state)
    }
}
