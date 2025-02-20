//
//  TabView.swift
//  VModel
//
//  Created by user on 2/20/25.
//

import SwiftUI

struct ImageCarouselView: View {
    let images: [GraphQLMedia]
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                
                TabView(selection: $selectedIndex) {
                  
                    ForEach(images.indices, id: \.self) { index in
                        if let url = URL(string: images[index].itemLink) {
                            
                            AsyncImage(url: url) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .tag(index)
                        }

                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .frame(height: 500)
            
            HStack(spacing: 6) {
                ForEach(images.indices, id: \.self) { index in
                    Circle()
                        .fill(index == selectedIndex ? Color.black : Color.gray.opacity(0.3))
                        .frame(width: index == selectedIndex ? 10 : 6, height: index == selectedIndex ? 10 : 6)
                        .opacity(index == selectedIndex ? 1 : 0.5) // Fade effect
                        .animation(.easeInOut(duration: 0.3), value: selectedIndex)
                }
            }
            .padding(.top, 8)
        }
    }
}
