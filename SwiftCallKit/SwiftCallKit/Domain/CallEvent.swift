//
//  CallEvent.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import Foundation
enum CallEvent: Equatable {
    case startOutgoing
    case receiveIncoming
    case accept
    case connected
    case end(reason: EndReason)
    case failed(reason: EndReason)

}
