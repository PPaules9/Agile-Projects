//
//  User.swift
//  Agile Project
//
//  Created by Pavly Paules on 29/03/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id : String
    let fullName: String
    let email: String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            //So this will look after FullName and will divide it up and give us the initials (First two letters)
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static var Mock_USER = User(id: NSUUID().uuidString, fullName: "Pavly Paules", email: "test@gmail.com")
}
