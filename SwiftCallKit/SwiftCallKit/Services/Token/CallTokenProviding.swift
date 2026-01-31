//
//  CallTokenProviding.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 31/01/2026.
//

import Foundation

// MARK: - Call Token Providing
//
// Role:
// Responsible for fetching secure access tokens required to join a call.
//
// Responsibilities:
// - Fetch a call token from a backend or secure source
// - Handle async token retrieval
//
// Non-responsibilities:
// - No networking implementation details
// - No call state decisions
// - No media handling
// - No UI concerns
protocol CallTokenProviding {

    /// Fetch a secure token required to join a call
    /// - Returns: A token string
    /// - Throws: An error if the token cannot be fetched
    func fetchToken() async throws -> String
}
