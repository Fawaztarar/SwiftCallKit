//
//  Call.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import Foundation


struct Call: Equatable {
    let id: UUID
    let isOutgoing: Bool
    var state: CallState
}
