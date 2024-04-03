//
//  BannerView.swift
//  Agile Project
//
//  Created by Pavly Paules on 02/04/2024.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack{
            Rectangle()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 285, alignment: .leading)

    }
}

#Preview {
    BannerView()
}
