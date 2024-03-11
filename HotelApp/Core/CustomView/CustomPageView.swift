//
//  CustomPageView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct CustomPageView: View {
    @State var imageUrls: [URL] = []
    @State private var selectedPage = 0
    private let selectedIndexOpacity = 1.0
    private let stepSize = 0.05

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedPage) {
                ForEach(imageUrls.indices, id: \.self) { index in
                    let imageUrl = imageUrls[index]
                    AsyncImage(url: imageUrl) { image in
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
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .cornerRadius(15)

            HStack(spacing: 5) {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    let opacity = calculateOpacity(from: index)
                    Button {
                        selectedPage = index
                    } label: {
                        Circle()
                            .tint(.black)
                            .frame(width: 7, height: 7)
                            .opacity(opacity)
                            .contentShape(Rectangle())
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.white)
            .cornerRadius(5)
            .padding(8)
        }
    }

    private func calculateOpacity(from index: Int) -> Double {
        let opacities: [Double] = Array(stride(from: 0.27, through: 0, by: -stepSize))
        return (index == selectedPage) ? selectedIndexOpacity : opacities[index]
    }
}
