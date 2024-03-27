//
//  SpikeView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI

struct SpikeView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Spikes Yet", systemImage: "custom.figure.walk.motion.trianglebadge.exclamationmark.badge.plus")
        } description: {
            Text("There is no Projects yet")
        }
    }
}

#Preview {
    SpikeView()
}
