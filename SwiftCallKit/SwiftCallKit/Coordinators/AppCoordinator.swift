//
//  AppCoordinator.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 28/01/2026.
//

//import Foundation
//import SwiftUI
//
//
//final class AppCoordinator: Coordinator {
//
//    @ViewBuilder
//    func start() -> some View {
//        RootView()
//    }
//}

import SwiftUI

final class AppCoordinator: Coordinator {

    private let container: AppDependencyContainer

    init(container: AppDependencyContainer) {
        self.container = container
    }

    @ViewBuilder
    func start() -> some View {
        container.makeCallRootView()
    }
}
