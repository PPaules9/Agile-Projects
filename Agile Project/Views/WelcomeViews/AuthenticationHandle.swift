//
//  AuthenticationHandle.swift
//  Agile Project
//
//  Created by Pavly Paules on 29/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore


@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    //this is will tell us whether thier is a user logged in or not
    //this is a Firebase auth user
    
    @Published var currentUser: User?
    //This is our user
    
    init() {
        //Keep us Logged in, this is will check if thier is a user logged in
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("Failed to Login\(error.localizedDescription)")
        }
    }
    
    func signUp(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            //await the result that this will give it back to me
            self.userSession = result.user
            //Now this is a User Object that comes out
            //this is the Firebase object
            
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            //this is our object
            let encodedUser = try Firestore.Encoder().encode(user)
            
            try await Firestore.firestore().collection("user").document(user.id).setData(encodedUser)
            //upload the Data to the FireStore
            
            await fetchUser()
            //after we creating the user we need to fetch the data 
        } catch {
            print("Debug: Failed to Create a new User \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil //signs out user on backend
            self.currentUser = nil //alli a7na aolna fle welcom le nill azher al welcomeView, wipes out data
        } catch {
            print("Failed to Sign Out \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        //A Function to fetch our user Data
        //We want to go over the Firebase and grap that data to our user here
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser = try? snapshot.data(as: User.self)
        
    }
}
