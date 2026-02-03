//
//  CallView.swift
//  SwiftCallKit
//
//  Created by Fawaz Tarar on 03/02/2026.
//

import Foundation
import SwiftUI

struct CallView: View {

    @ObservedObject
    var viewModel: CallViewModel

    var body: some View {
        VStack(spacing: 24) {

            Text("Call State")
                .font(.headline)

            Text(viewModel.stateLabel)
                .font(.title2)

            Spacer()

            HStack(spacing: 16) {

                Button("Start Call") {
                    viewModel.send(event: .startOutgoing)
                }
                .buttonStyle(.borderedProminent)

                Button("End Call") {
                    viewModel.send(event: .end(reason: .localHangUp))
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

