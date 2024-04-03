//
//  HomeView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        ZStack{
            Image("dd")
            NavigationStack{
                VStack{
                    
                    Text("Insights")
                        .font(.headline)
                    
                    
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle", title: "Sign Out", tintColor: Color(.systemGray))
                    }
                }
                .navigationTitle("Dashboard")
                .toolbarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    HomeView()
}
