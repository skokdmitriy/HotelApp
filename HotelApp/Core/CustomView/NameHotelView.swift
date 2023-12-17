//
//  NameHotelView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct NameHotel: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Color(hex: Colors.backgroundRating)
                    .frame(width: 149, height: 29, alignment: .center)
                    .opacity(0.2)
                HStack(alignment: .center, spacing: 2) {
                    Image(systemName: "star.fill")
                        .frame(width: 15, height: 15)
                    Text("5")
                    Text("Превосходно")
                }
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.textColorRating))
            }
            .cornerRadius(5)

            Text("Steigenberger Makadi")
                .font(.system(size: 22))
            Text("Madinat Makadi, Safaga Road, Makadi Bay, Египет")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: Colors.blue))
        }
    }
}
