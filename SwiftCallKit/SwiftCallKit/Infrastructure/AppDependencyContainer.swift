//
//  AppDependencyContainer.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

import SwiftUI

final class AppDependencyContainer {

    static let shared = AppDependencyContainer()
    private init() {}

    // MARK: - App Coordinator

    func makeAppCoordinator() -> AppCoordinator {
        AppCoordinator(container: self)
    }

    // MARK: - Call Feature Composition
 
    func makeCallRootView() -> some View {

        // System / Infrastructure
        let callKitManager = CallKitManager()
        let mediaManager = LiveKitMediaManager()
        let tokenProvider = CallTokenService()

        // Coordinator
        let callCoordinator = CallCoordinator(
            callKitManager: callKitManager,
            mediaManager: mediaManager,
            tokenProvider: tokenProvider
        )

        // ViewModel
        let viewModel = CallViewModel(
            coordinator: callCoordinator
        )

        // Root View
        return CallView(viewModel: viewModel)
    }
}
