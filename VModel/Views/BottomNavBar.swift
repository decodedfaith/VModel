//
//  BottomNavBar.swift
//  VModel
//
//  Created by user on 2/20/25.
//

import SwiftUI

struct BottomNavBar: View {
    @State private var selectedIndex = 0
    let icons = ["home", "global", "group", "vector"]
    let profileImage = "bitmap"

    var body: some View {
     
            HStack {
                ForEach(0..<icons.count, id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                    }) {
                        Image(icons[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .padding()
                            .opacity(selectedIndex == index ? 1.0 : 0.6)
                    }
                    .padding(.horizontal, 4)
                }

                // Profile image (last item)
                Button(action: {
                    selectedIndex = icons.count
                }) {
                    Image(profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 3)
                }
                .padding(.horizontal, 10)
            
            
        }
    }
}

