//
//  Agile_ProjectApp.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI
import Firebase


@main
struct Agile_ProjectApp: App {

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomePageView()
        }
    }
}
