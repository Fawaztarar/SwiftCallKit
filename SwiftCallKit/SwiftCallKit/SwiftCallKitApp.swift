//
//  SwiftCallKitApp.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import SwiftUI


@main
struct SwiftCallKitApp: App {

    private let container = AppDependencyContainer.shared

    var body: some Scene {
        WindowGroup {
            container
                .makeAppCoordinator()
                .start()
        }
    }
}
