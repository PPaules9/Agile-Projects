//
//  SignUp.swift
//  Agile Project
//
//  Created by Pavly Paules on 23/03/2024.
//
import Firebase
import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

struct SignUp: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    // Image
                    Image(.welcomePic)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 80)
                        .padding(.vertical, 32)
                    
                    VStack(spacing: 24){
                        //A Form Field
                        
                        InputView(text: $name, title: "Full Name", placeholder: "Enter your name")
                        
                        InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                            .autocapitalization(.none)
                        
                        InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                        
                        ZStack{
                            InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Enter your password", isSecureField: true)
                            if !password.isEmpty && !confirmPassword.isEmpty {
                                if password == confirmPassword {
                                    Image(systemName: "checkmark.circle")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                } else {
                                    Image(systemName: "xmark.circle")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    // Sign Up Button
                    Button {
                        Task{
                            try await viewModel.signUp(withEmail: email, password: password, fullName: name)
                        }
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
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(10)
                    .padding(.top, 20)
                    
                    
                    HStack{
                        VStack{ Divider()}
                        Text("or")
                        VStack{ Divider()}
                    }
                    
                    VStack{
                        Button {
                            //Open SignInWWithGoogle Function
                        } label: {
                            HStack {
                                Image("a.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, alignment: .trailing)
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                Text("Sign Up with Apple")
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
                                
                                Text("Sign Up with Google")
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                        
                    }
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
    }
    //    func signInWithGoogle() async -> Bool {
    //        guard let clientID = FirebaseApp.app()?.options.clientID else {
    //          fatalError("No client ID found in Firebase configuration")
    //        }
    //        let config = GIDConfiguration(clientID: clientID)
    //        GIDSignIn.sharedInstance.configuration = config
    //
    //        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
    //              let window = await windowScene.windows.first,
    //              let rootViewController = await window.rootViewController else {
    //          print("There is no root view controller!")
    //          return false
    //        }
    //
    //          do {
    //            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
    //
    //            let user = userAuthentication.user
    //            guard let idToken = user.idToken else {
    //                print( "ID token missing") }
    //            let accessToken = user.accessToken
    //
    //            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
    //                                                           accessToken: accessToken.tokenString)
    //
    //            let result = try await Auth.auth().signIn(with: credential)
    //            let firebaseUser = result.user
    //            print("User \(firebaseUser.uid) signed in with email \(firebaseUser.email ?? "unknown")")
    //            return true
    //          }
    //          catch {
    //            print(error.localizedDescription)
    //            return false
    //          }
    //      }
    
}
extension SignUp: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !name.isEmpty
    }
}

#Preview {
    SignUp()
}

