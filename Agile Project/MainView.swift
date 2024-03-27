//
//  MainView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//
import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView {
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
            .navigationTitle("Agile Projects")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.crop.circle")
                    }
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
