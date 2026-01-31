//
//  CallCoordinator.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation



// MARK: - Call Coordinator

//“Notified when call state changes”
//“Responsible for handling lifecycle transitions”

//Its role

// coordination
//side effects
//system/services

// inputs

//CallState?
//User actions?
//Push events?

// outputs

//System calls
//Navigation
//Service invocations

// Responsibilities:

//Showing call UI
//Starting CallKit
//Connecting media
//Ending system call
//Cleaning up resources


//Reacting to call state changes
//Triggering side effects
//Orchestrating services

// Non-responsibilities:

//Does not decide call validity
//Does not hold business rules
//Does not expose UI state



protocol CallCoordinating {
    // Called when the call state changes
    // Used to trigger system and service side effects
    
    func callStateDidChange(to state: CallState)
}



final class CallCoordinator: CallCoordinating {
    
    private let callKitManager: CallKitManaging

      init(callKitManager: CallKitManaging) {
          self.callKitManager = callKitManager
      }


    func callStateDidChange(to state: CallState) {

        switch state {

        case .idle:
            // No active call
            // App is in resting state
            break

        case .calling:
            // Outgoing call initiated
            // Show outgoing call UI
            // Inform system of outgoing call
            
            callKitManager.startOutgoingCall()
            
            
            break

        case .ringing:
            // Incoming call received
            // Show incoming call UI
            // Inform system of incoming call
            callKitManager.reportIncomingCall()
            break

        case .connecting:
            // Call accepted or initiated
            // Prepare media and signalling
            break

        case .active:
            // Call is fully active
            // Media flowing
            break

        case .ended:
            // Call finished
            // Tear down media and system resources
            // Use reason for analytics or UI messaging
            break
        }
    }
}


