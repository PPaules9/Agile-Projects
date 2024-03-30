//
//  MainView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//
import SwiftUI

struct MainView: View {
    @State private var showMenu = false
    
    var body: some View {
        NavigationStack {
            TabView {
                Projects()
                    .tabItem {
                        Label("Projects", systemImage: "calendar.badge.checkmark")
                    }
                
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                                
                SpikeView()
                    .tabItem {
                        Label("Spike", systemImage: "figure.walk.motion.trianglebadge.exclamationmark")
                    }
                
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("Agile Projects")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ProfileView(isShowing: $showMenu)) {
                        Image(systemName: "person.crop.circle")
                    }
                    .navigationBarBackButtonHidden()

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ShowMoreView()) {
                        Image(systemName: "ellipsis.circle") 
                        // Menu icon (3 dots)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
