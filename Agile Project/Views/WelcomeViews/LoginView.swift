//
//  LoginView.swift
//  Agile Project
//
//  Created by Pavly Paules on 25/03/2024.
//
import Firebase
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                
                //Adding Image
                Image(.welcomePic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 159, height: 80)
                    .padding(.vertical, 32)
                
                //A Welcome Message
                VStack(spacing: 24){
                    Text("Welcome! 😃")
                        .foregroundColor(.mainBlack)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    
                    //A Form Field
                    
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Sign in Button
                Button {
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
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
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                
                HStack{
                    VStack{ Divider()}
                    Text("or")
                    VStack{ Divider()}
                }
                
                
                
                Button() {
                    //Open SignInWWithGoogle Function
            } label: {
                HStack {
                    Image("GoogleLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, alignment: .trailing)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("Sign in with Apple")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    Spacer()
                }
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemGray4))
            .cornerRadius(10)
                
                
                
                Button() {
                    //Open SignInWWithGoogle Function
            } label: {
                HStack {
                    Image("GoogleLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, alignment: .trailing)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("Sign in with Google")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    Spacer()
                }
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemGray4))
            .cornerRadius(10)
                Spacer()
                
                
                
                
                
                NavigationLink {
                    SignUp()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account yet?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                Spacer()

            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
