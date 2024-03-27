//
//  Projects.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI

struct Projects: View {
    
    var body: some View {
        ContentUnavailableView {
            Label("No Projects", systemImage: "calendar.badge.plus")
        } description: {
            Text("There is no Projects yet")
        }
        
    }
}

#Preview {
    Projects()
}
