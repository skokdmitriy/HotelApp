//
//  DescriptionHotelView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct DescriptionHotelView: View {
    let hotel: HotelModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            makeImageSliderSection()
            makeNameHotelView()
            makePriceSection()
        }
        .padding(.horizontal)
    }

    private func makeImageSliderSection() -> some View {
        ImageSlider(imageUrls: hotel.imageUrls)
            .frame(height: 257)
    }

    private func makeNameHotelView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Color(hex: Colors.backgroundRating)
                    .frame(width: 149, height: 29, alignment: .center)
                    .opacity(0.2)
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: Icons.star)
                        .frame(width: 15, height: 15)
                    Text(String(hotel.rating))
                    Text(hotel.ratingName)
                }
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.textColorRating))
            }
            .cornerRadius(5)
            
            Text(hotel.name)
                .font(.system(size: 22))
            Text(hotel.adress)
                .font(.system(size: 14))
                .foregroundColor(Color(hex: Colors.blue))
        }
    }

    private func makePriceSection() -> some View {
        HStack(alignment: .bottom) {
            Text("от \(hotel.minimalPrice.formatted(.number.locale(.init(identifier: "fr_FR")))) ₽")
                .font(.system(size: 30, weight: .semibold))
            Text(hotel.priceForIt)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.gray))
        }
    }
}

//#Preview {
//    DescriptionHotelView(hotel: HotelModel)
//}
