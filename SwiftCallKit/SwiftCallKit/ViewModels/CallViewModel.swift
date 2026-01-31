//
//  CallViewModel.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import Foundation
import Combine



//Domain: decides what state is valid
//ViewModel: decides when state changes
//Coordinator: decides what the app does because of it

// MARK: - Call ViewModel
//
// Acts as the bridge between UI / system events and the Domain layer.
// Owns the current CallState and applies CallEvents via CallStateMachine.
//
// Responsibilities:
// - Expose current call state to the UI
// - Accept user / SDK driven CallEvents
// - Delegate transition logic to the Domain
//
// Non-responsibilities:
// - No business rules
// - No CallKit / LiveKit logic
// - No async networking
//

@MainActor
final class CallViewModel: ObservableObject {
    
    // MARK: - Published State

    @Published private(set) var state: CallState = .idle

    // MARK: - Dependencies

    private let stateMachine: CallStateMachine
    
    private let coordinator: CallCoordinating?
    
    // MARK: - Initialisation
    
    init(
        initialState: CallState = .idle,
        stateMachine: CallStateMachine? = nil,
        coordinator: CallCoordinating? = nil
    ) {
        self.state = initialState
        self.stateMachine = stateMachine ?? CallStateMachine()
        self.coordinator = coordinator
    }
    
    convenience init(
        initialState: CallState = .idle,
        coordinator: CallCoordinating? = nil
    ) {
        self.init(
            initialState: initialState,
            stateMachine: nil,
            coordinator: coordinator
        )
    }

    
    // MARK: - Event Handling
    
    func send(event: CallEvent) {
        let newState = stateMachine.transition(
            from: state,
            event: event
        )

        guard newState != state else { return }

        state = newState
        coordinator?.callStateDidChange(to: newState)
    }

    
    
    
}

