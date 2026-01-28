//
//  AppDependencyContainer.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import Foundation
final class AppDependencyContainer {

    static let shared = AppDependencyContainer()
    private init() {}

    func makeAppCoordinator() -> AppCoordinator {
        AppCoordinator()
    }
}
