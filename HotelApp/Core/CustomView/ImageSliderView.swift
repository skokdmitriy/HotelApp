//
//  ImageSliderView.swift.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct ImageSlider: View {
    @State var imageUrls: [URL] = []

    var body: some View {
        TabView {
            ForEach(imageUrls, id: \.self) { url in
                AsyncImage(url: url) { image in
                    switch image {
                    case .empty:
                        ProgressView()
                            .tint(.accentColor)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(_):
                        Image(systemName: Icons.failureLoadImage)
                    @unknown default:
                        Image(systemName: Icons.failureLoadImage)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .cornerRadius(15)
    }
}
