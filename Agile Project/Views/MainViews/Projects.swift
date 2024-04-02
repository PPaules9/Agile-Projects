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
                .font(.custom("Charter", size: 16))

            Text("There is no Projects yet")
                .font(.custom("RedditMono-Regular", size: 16))
        }
        
    }
}

#Preview {
    Projects()
}
