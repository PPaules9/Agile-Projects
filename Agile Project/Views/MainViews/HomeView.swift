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
        VStack{
            
            if viewModel.currentUser == nil {
                Text("No viewModel")
            } else {
                Text("There is viewModel")
                    .font(.custom("Reddit Mono", size: 16))

            }
            
            
            Button{
                //sign out
                viewModel.signOut()
                print("User is Signed Out")
                  
                
            } label: {
                SettingRowView(imageName: "arrow.left.circle", title: "Sign Out", tintColor: Color(.systemGray))
            }
        }
    }
}

#Preview {
    HomeView()
}
