//
//  WelcomePageView.swift
//  Agile Project
//
//  Created by Pavly Paules on 22/03/2024.
//
import Firebase
import SwiftUI

struct WelcomePageView: View {
    @State private var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn {
            MainView()
            
        } else {
            content
        }
    }
    
    var content: some View {
            NavigationView {
            ZStack {
                Color("mainColor")
                    .ignoresSafeArea()
                
                
                VStack(alignment: .leading){
                    
                    Image(.trial)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350,height: 300)
                        .scaledToFit()
                        .padding()
                    
                    
                    Text("Hello Boss👋 \nWelcome to Agile Projects!")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    
                    Text("A Workspace to over 12,000 Mangers around the global of the world.")
                        .font(.title2)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    
                    Spacer()
                    
                    
                    HStack {
                        Spacer()
                        VStack(alignment: .center, spacing: 10){
                            
                            NavigationLink("Log in", destination: LoginView())
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 60)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            
                            
                            NavigationLink("Create Account", destination: SignUp())
                            .padding(.horizontal)
                            .frame(width: 300, height: 60)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(destination: MainView()){
                        Text("Skip")
                            .shadow(radius: 10)
                    }
                }
            }
        }
    }
}


#Preview {
    WelcomePageView()
}
