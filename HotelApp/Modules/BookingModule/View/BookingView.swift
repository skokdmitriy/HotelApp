//
//  BookingView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 23.12.2023.
//

import SwiftUI

struct BookingView: View {
    @EnvironmentObject private var viewModel: BookingViewModel
    var body: some View {
        if let booking = viewModel.booking {
            makeNameHotelView(booking)
            makeBookingDetails(booking)
        }
    }

    private func makeNameHotelView(_ booking: BookingModel) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Color(hex: Colors.backgroundRating)
                    .frame(width: 149, height: 29, alignment: .center)
                    .opacity(0.2)
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: Icons.star)
                        .frame(width: 15, height: 15)
                    Text(String(booking.horating))
                    Text(booking.ratingName)
                }
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.textColorRating))
            }
            .cornerRadius(5)

            Text(booking.hotelName)
                .font(.system(size: 22))
            Text(booking.hotelAdress)
                .font(.system(size: 14))
                .foregroundColor(Color(hex: Colors.blue))
        }
    }

    private func makeBookingDetails(_ booking: BookingModel) -> some View {
        VStack(spacing: 6){
            DetailsView(firstText: "Вылет из",
                        secondText: booking.departure
            )
            DetailsView(firstText: "Страна, город",
                        secondText: booking.arrivalCountry
            )
            DetailsView(firstText: "Даты",
                        secondText: "\(booking.tourDateStart) - \(booking.tourDateStop)"
            )
            DetailsView(firstText: "Кол-во ночей",
                        secondText: "\(booking.numberOfNights) ночей"
            )
            DetailsView(firstText: "Отель",
                        secondText: booking.hotelName
            )
            DetailsView(firstText: "Номер",
                        secondText: booking.room
            )
            DetailsView(firstText: "Питание",
                        secondText: booking.nutrition
            )
        }
    }
}

#Preview {
    BookingView()
}
