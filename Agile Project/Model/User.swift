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
}
