//
//  ProfileView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack (alignment: .leading, spacing: 4 ){
                            
                            Text(user.fullName)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                }
                Section("General"){
                    HStack{
                        SettingRowView(imageName: "gear", title: "Version", tintColor: .blue)
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    SettingRowView(imageName: "i.circle", title: "About", tintColor: .blue)
                }
                
                Section("Account"){
                    Button{
                        //sign out
                        viewModel.signOut()
                        print("User is Signed Out")
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle", title: "Sign Out", tintColor: Color(.systemGray))
                    }
                    
                    
                    Button{
                        //Delete
                        print("User has Delete his Account")
                    } label: {
                        SettingRowView(imageName: "trash.circle", title: "Delete Account", tintColor: Color(.systemGray))
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
