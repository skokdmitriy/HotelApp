//
//  RatingView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 29.12.2023.
//

import SwiftUI

struct RatingView: View {
    let ratingCount: Int
    let ratingName: String

    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: Icons.star)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(Color(hex: Colors.textColorRating))
            Text(String(ratingCount))
                .modifier(ConfigText())
            Text(ratingName)
                .modifier(ConfigText())
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .background(
            Color(hex: Colors.backgroundRating)
                .opacity(0.2)
                .cornerRadius(5)
        )

    }

    struct ConfigText: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(hex: Colors.textColorRating))
        }
    }
}
