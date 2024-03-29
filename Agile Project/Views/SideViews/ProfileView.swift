//
//  ProfileView.swift
//  Agile Project
//
//  Created by Pavly Paules on 15/03/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section{
                HStack{
                    Text("PP")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack (alignment: .leading, spacing: 4 ){
                        
                        Text("Pavly Alkess Paules")
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("test@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                            
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
                
                SettingRowView(imageName: "about", title: "About", tintColor: .blue)
            }
            
            
            Section("Follow us on"){
                SettingRowView(imageName: "about", title: "Facebook", tintColor: .blue)
                SettingRowView(imageName: "about", title: "Instagram", tintColor: .blue)
                SettingRowView(imageName: "about", title: "X, Twitter", tintColor: .blue)
            }
            
            
            Section("Account"){
                Button{
                    //sign out
                    print("User is Signed Out")
                } label: {
                    SettingRowView(imageName: "arrow.left.circle", title: "Sign Out", tintColor: Color(.systemGray))
                }
                
                
                Button{
                    //sign out
                    print("User has Delete his Account")
                } label: {
                    SettingRowView(imageName: "xmark.circle", title: "Delete Account", tintColor: Color(.systemGray))
                }
                
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
