//
//  DescriptionHotelView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct DescriptionHotelView: View {
    let price = 134268.formatted(.number.locale(.init(identifier: "fr_FR")))

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            makeImageSliderSection()
            makeNameHotelView()
            makePriceSection()
        }
    }

    private func makeImageSliderSection() -> some View {
        ImageSlider()
            .frame(height: 257)
    }

    private func makeNameHotelView() -> some View {
        NameHotel()
    }

    private func makePriceSection() -> some View {
        HStack(alignment: .bottom) {
            Text("от \(price) ₽")
                .font(.system(size: 30))
            Text("За тур с перелётом")
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.gray))
        }
    }
}

#Preview {
    DescriptionHotelView()
}
