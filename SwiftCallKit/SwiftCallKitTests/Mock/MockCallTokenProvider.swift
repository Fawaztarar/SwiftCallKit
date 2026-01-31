//
//  MockCallTokenProvider.swift
//  SwiftCallKitTests
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation
@testable import SwiftCallKit

final class MockCallTokenProvider: CallTokenProviding {

    private(set) var didFetchToken = false
    var tokenToReturn: String = "mock-token"

    func fetchToken() async throws -> String {
        didFetchToken = true
        return tokenToReturn
    }
}
