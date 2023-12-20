//
//  AboutHotelView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct AboutHotelView: View {
    let hotel: HotelModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(Tittle.aboutHotel)
                .font(.system(size: 22))
                .padding(.top, 8)

            TagsView(availableWidth: UIScreen.main.bounds.width,
                     data: hotel.aboutTheHotel.peculiarities, spacing: 5,
                     alignment: .leading
            ) { item in
                Text(verbatim: item)
                    .frame(height: 29)
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Colors.gray))
                    .background(Color(hex: Colors.backgroundTag))
                    .cornerRadius(5)
            }
            Text(hotel.aboutTheHotel.description)
                .font(.system(size: 16))

            
        }
        .padding(.horizontal)
    }
}

//
//#Preview {
//    AboutHotelView()
//}
