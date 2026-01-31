//
//  CallViewModelTests.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 28/01/2026.
//


import XCTest
@testable import SwiftCallKit

final class CallViewModelTests: XCTestCase {

    func testViewModelStartsInIdleState() async {
        await MainActor.run {
            // Arrange
            let viewModel = CallViewModel()

            // Assert
            XCTAssertEqual(viewModel.state, .idle)
        }
    }

    func testEndingCallTransitionsToEndedState() async {
        await MainActor.run {
            // Arrange
            let viewModel = CallViewModel(initialState: .active)

            // Act
            viewModel.send(event: .end(reason: .localHangUp))

            // Assert
            XCTAssertEqual(viewModel.state, .ended(reason: .localHangUp))
        }
    }
    
    
    
    
    func testCoordinatorIsNotifiedWhenStateChanges() async {
        
        await MainActor.run {
            // given
            let coordinator = MockCallCoordinator()
            let viewModel = CallViewModel(
                initialState: .idle,
                coordinator: coordinator
            )
            
            // when
            viewModel.send(event: .startOutgoing)
            
            // then
            XCTAssertEqual(coordinator.receivedStates, [.calling])
        }
    }

}

