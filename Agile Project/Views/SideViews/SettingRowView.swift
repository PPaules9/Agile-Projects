//
//  SettingRowView.swift
//  Agile Project
//
//  Created by Pavly Paules on 29/03/2024.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.custom("Charter", size: 16))
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
