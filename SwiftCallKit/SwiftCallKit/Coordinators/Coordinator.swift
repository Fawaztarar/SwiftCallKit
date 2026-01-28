//
//  Coordinator.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import SwiftUI

protocol Coordinator {
    associatedtype StartView: View
    @ViewBuilder func start() -> StartView
}
