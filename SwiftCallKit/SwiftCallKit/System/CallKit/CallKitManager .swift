//
//  CallKitManager .swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 03/02/2026.
//

import Foundation
import CallKit

final class CallKitManager: NSObject, CallKitManaging {
    
  

    
    
    private let callController = CXCallController()
    private let provider: CXProvider
    private let callUUID = UUID()


    override init() {
        let configuration = CXProviderConfiguration(localizedName: "SwiftCallKit")
        
        
        configuration.supportsVideo = false
        configuration.maximumCallsPerCallGroup = 1
        configuration.supportedHandleTypes = [.generic]

        self.provider = CXProvider(configuration: configuration)
        
        super.init()

         provider.setDelegate(self, queue: nil)

    }

    
   

    func startOutgoingCall() {
        Log.info("Requesting CallKit startOutgoingCall")
        
        let handle = CXHandle(type: .generic, value: "Call")
        let action = CXStartCallAction(call: callUUID, handle: handle)
        let transaction = CXTransaction(action: action)
        
     
        
        Task {
              try? await callController.request(transaction)
            
            provider.reportOutgoingCall(
                       with: callUUID,
                       startedConnectingAt: nil
                   )
          }


    }
    
    func reportIncomingCall() {
        Log.info("Reporting incoming call to CallKit")
        
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "Incoming Call")
        update.hasVideo = true

        Task {
            try? await provider.reportNewIncomingCall(
                with: callUUID,
                update: update
            )
        }
    }

    
    func endCall() {
        Log.info("Requesting CallKit endCall")
        
        let action = CXEndCallAction(call: callUUID)
        let transaction = CXTransaction(action: action)
        
        Task {
            try? await callController.request(transaction)
        }


    }
    
    
}


extension CallKitManager: CXProviderDelegate {
    
    func provider(
        _ provider: CXProvider,
        perform action: CXStartCallAction
    ) {
        Log.info("CallKit confirmed start call")
        provider.reportOutgoingCall(
            with: action.callUUID,
            startedConnectingAt: nil
        )
        action.fulfill()
    }

    func provider(
        _ provider: CXProvider,
        perform action: CXEndCallAction
    ) {
        action.fulfill()
    }

    
    func providerDidReset(_ provider: CXProvider) {
        // Clean up if needed
    }
    
}





