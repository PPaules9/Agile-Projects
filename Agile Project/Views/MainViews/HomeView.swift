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
        Button{
            //sign out
            viewModel.signOut()
            print("User is Signed Out")
        } label: {
            SettingRowView(imageName: "arrow.left.circle", title: "Sign Out", tintColor: Color(.systemGray))
        }
            if viewModel.currentUser == nil {
                Text("Thier is no viewModel")
            } else {
                Text("Mawgoda")
            }
    }
}

#Preview {
    HomeView()
}
