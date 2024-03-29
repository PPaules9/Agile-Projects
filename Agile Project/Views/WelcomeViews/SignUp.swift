//
//  SignUp.swift
//  Agile Project
//
//  Created by Pavly Paules on 23/03/2024.
//
import Firebase
import SwiftUI

struct SignUp: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showMainView = false
    var body: some View {
        NavigationStack{
            VStack{
                
                //Adding Image
                Image(.welcomePic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 120)
                    .padding(.vertical, 32)
                
                //A Welcome Message
                VStack(spacing: 24){
                    Text("Never Miss a Deadline")
                        .foregroundColor(.mainBlack)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
        
                    //A Form Field
                    
                    InputView(text: $name, title: "Full Name", placeholder: "Enter your name")
                    
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Enter your password", isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Sign Up Button
                Button {
                    print("User is Signed Up")
                } label: {
                    HStack {
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 20)
                
                Spacer()
                
                
                NavigationLink {
                    LoginView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3){
                        Text("Already have an account?")
                        Text("Login")
                            .fontWeight(.bold)
                    }
                }
            }
            
        }
    }
    
    
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if let e = error { //also means if thier is an error
                print(e.localizedDescription)
            } else {
                showMainView = true
            }
        }
    }
}

#Preview {
    SignUp()
}

