//
//  BookingView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 23.12.2023.
//

import SwiftUI

struct BookingView: View {
    @EnvironmentObject private var viewModel: BookingViewModel
    @Binding var isActivateRootLink: Bool
    @State var phoneNumber = ""
    @State var emailText = ""
    @State private var rotationAngle: Double = 0
    @State private var isAnimationButton = false
    @State private var views: [AnyView] = []

    var body: some View {
        ScrollView(showsIndicators: false) {
            if let booking = viewModel.booking {
                VStack(spacing: 8) {
                    makeNameHotelSection(booking)
                    makeDetailsSection(booking)
                    makeInfoSection()
                    makeTouristSection()
                    makeAddTouristSection()
                    makeFinalPriceSection(booking)
                }
            }

            NavigationLink {
                PaymentView(isActivateRootLink: $isActivateRootLink)
            } label: {
                Text("\(Title.pay) \(viewModel.getFinalPrice())")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle(Title.booking)
        .padding(.horizontal)
    }

    private func makeNameHotelSection(_ booking: BookingModel) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
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
                Spacer()
            }

            Text(booking.hotelName)
                .font(.system(size: 22))
            Text(booking.hotelAdress)
                .font(.system(size: 14))
                .foregroundColor(Color(hex: Colors.blue))
        }
    }

    private func makeDetailsSection(_ booking: BookingModel) -> some View {
        VStack(spacing: 6){
            DetailsView(firstText: Title.departure,
                        secondText: booking.departure
            )
            DetailsView(firstText: Title.country,
                        secondText: booking.arrivalCountry
            )
            DetailsView(firstText: Title.date,
                        secondText: "\(booking.tourDateStart) - \(booking.tourDateStop)"
            )
            DetailsView(firstText: Title.countNights,
                        secondText: "\(booking.numberOfNights) \(Title.nights)"
            )
            DetailsView(firstText: Title.hotelName,
                        secondText: booking.hotelName
            )
            DetailsView(firstText: Title.room,
                        secondText: booking.room
            )
            DetailsView(firstText: Title.nutrition,
                        secondText: booking.nutrition
            )
        }
    }

    private func makeInfoSection() -> some View {
        VStack(alignment: .leading) {
            Text(Title.buyerInfo)
                .font(.system(size: 22, weight: .medium))

            VStack(alignment: .leading) {
                Text(Title.numberPhone)
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                    .padding(.top, 10)
                    .padding(.leading)

                TextField("+7 (***) ***-**-**", text: $phoneNumber)
                    .padding(.leading, 16)
                    .padding(.bottom, 10)
                    .keyboardType(.numberPad)
                    .textContentType(.telephoneNumber)
            }
            .background(Color(hex: Colors.background).cornerRadius(10))

            VStack(alignment: .leading) {
                Text(Title.mail)
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                    .padding(.top, 10)
                    .padding(.leading, 16)

                TextField(Title.mailPlaceholder, text: $emailText)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .padding(.leading, 16)
                    .padding(.bottom, 10)
            }
            .background(Color(hex: Colors.background).cornerRadius(10))

            Text(Title.privateText)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(Color(hex: Colors.gray))
        }
    }

    private func makeTouristSection() -> some View {
        VStack {
            HStack {
                Text(Title.firstTourist)
                    .font(.system(size: 22, weight: .medium))

                Spacer()

                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        rotationAngle -= 180
                        isAnimationButton.toggle()
                    }
                } label: {
                    Image(systemName: Icons.chevronUp)
                        .rotationEffect((Angle(degrees: rotationAngle)))
                }
                .frame(width: 32, height: 32, alignment: .center)
                .buttonStyle(.borderless)
                .background(Color(hex: Colors.blue).opacity(0.1))
                .cornerRadius(6)
            }

            if isAnimationButton == false {
                TouristView()
                    .transition(.opacity)
            }
        }
    }

    private func makeAddTouristSection() -> some View {
        VStack {
            ForEach(0..<views.count, id: \.self) { numberTourist in
                NextTouristView(tittleTourist: viewModel.getNumberTourist(numberTourist))
            }

            HStack {
                Text(Title.addTourist)
                    .font(.system(size: 22, weight: .medium))
                Spacer()

                Button {
                    withAnimation {
                        views.append(AnyView(TouristView()))
                    }
                } label: {
                    Image(systemName: Icons.plus)
                }
                .frame(width: 32, height: 32, alignment: .center)
                .buttonStyle(.borderedProminent)
                .cornerRadius(6)
                .disabled(views.count == 2)
            }
        }
    }

    private func makeFinalPriceSection(_ booking: BookingModel) -> some View {
        VStack(spacing: 8) {
            PriceView(firstText: Title.tour, secondText: booking.tourPrice)
            PriceView(firstText: Title.fuelCharge, secondText: booking.fuelCharge)
            PriceView(firstText: Title.serviceCharge, secondText: booking.serviceCharge)

            HStack(alignment: .top) {
                Text(Title.finalPrice)
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Colors.gray))

                Spacer()

                Text("\(viewModel.getFinalPrice().formatted(.number.locale(.init(identifier: "fr_FR")))) ₽")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(hex: Colors.blue))
            }
        }
    }
}
//#Preview {
//    BookingView()
//}
