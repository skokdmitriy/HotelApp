//
//  AboutHotelView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct AboutHotelView: View {
    var body: some View {


        let data = [
            "Бесплатный Wifi на всей территории отеля",
            "1 км до пляжа",
            "Бесплатный фитнес-клуб",
            "20 км до аэропорта"
            ]

        VStack(alignment: .leading, spacing: 8) {
            Text("Об отеле")
                .font(.system(size: 22))

            TagsView(availableWidth: 375,
                         data: data, spacing: 5,
                         alignment: .leading
            ) { item in
                Text(verbatim: item)
                    .frame(height: 29)
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Colors.gray))
                    .background(Color(hex: Colors.backgroundTag))
                    .cornerRadius(5)
            }

            Text("Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
                .font(.system(size: 16))
        }
    }
}


#Preview {
    AboutHotelView()
}
