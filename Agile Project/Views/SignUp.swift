//
//  SignUp.swift
//  Agile Project
//
//  Created by Pavly Paules on 23/03/2024.
//
import Firebase
import SwiftUI

struct SignUp: View {
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var showMainView = false

    var body: some View {
        NavigationView{
            ZStack{
                Color(.main)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    
                    
                    Image(.trial)
                        .padding(.vertical)
                        .padding(.horizontal)
                    
                    
                    
                    Text("Welcome! 😃")
                        .foregroundColor(.mainBlack)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: -55, y: -50)
                    
                    
                    Text("Your Project is about to be Ready")
                        .font(.title2)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                        .offset(x: -30, y: -58)
                    
                    
                    TextField("Name", text: $name)
                        .foregroundColor(.mainBlack)
                        .textFieldStyle(.plain)
                    
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    
                    TextField("Email", text: $email)
                        .foregroundColor(.mainBlack)
                        .textFieldStyle(.plain)
                    
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(.mainBlack)
                        .textFieldStyle(.plain)
                    
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    
                    Button("Sign Up") {
                        if email != "" && password != "" {
                            register()
                            showMainView = true
                        } else {
                            //Create an Alert
                            print("no")
                        }
                    }
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                   
                    if showMainView == true {
                        NavigationLink(destination: MainView()){
                        } .hidden()
                    }
                    Button("Sign UP"){
                        MainView()
                    }
                    
                    NavigationLink(destination: LoginView()){
                        Text("Aleardy Have an Account? Login")
                }.offset(x: 0, y: -10)
                    
                    Spacer()
                    
                }
                .frame(width: 350)
                
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


extension View {
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment){
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
