//
//  LoginView.swift
//  Agile Project
//
//  Created by Pavly Paules on 25/03/2024.
//
import Firebase
import SwiftUI

struct LoginView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showMainView = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                //Adding Image
                Image(.welcomePic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 159, height: 120)
                    .padding(.vertical, 32)
                
                //A Welcome Message
                VStack(spacing: 24){
                    Text("Welcome! 😃")
                        .foregroundColor(.mainBlack)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    Text("Your Project is about to be Ready")
                        .font(.title2)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    
                    //A Form Field
                    
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Sign in Button
                Button {
                    print("User is logged in")
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                
                Spacer()
                
                
                NavigationLink {
                    SignUp()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    LoginView()
}
