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
            VStack {
            if let booking = viewModel.booking {
                    makeNameHotelSection(booking)
                    makeDetailsSection(booking)
                    makeInfoSection()
                    makeTouristSection()
                    makeAddTouristSection()
                    makeFinalPriceSection(booking)
                }
                VStack(spacing: .zero) {
                    Divider()

                    NavigationLink {
                        PaymentView(isActivateRootLink: $isActivateRootLink)
                    } label: {
                        Text("\(Title.pay) \(viewModel.getFinalPrice()) \(Title.rub)")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 12)
                    .padding(.horizontal)
                }
                .background(Color.white)
            }
            .offset(y: 8)
            .background(Color(hex: Colors.backgroundScreen))
            .navigationTitle(Title.booking)
        }
    }

    private func makeNameHotelSection(_ booking: BookingModel) -> some View {
        HStack {
            VStack(alignment: .leading) {
                RatingView(ratingCount: booking.horating, ratingName: booking.ratingName)

                Text(booking.hotelName)
                    .font(.system(size: 22, weight: .medium))

                Text(booking.hotelAdress)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: Colors.blue))
            }
            Spacer()
        }
        .modifier(ConfigView())
    }

    private func makeDetailsSection(_ booking: BookingModel) -> some View {
        VStack(spacing: 16){
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
        .modifier(ConfigView())
    }

    private func makeInfoSection() -> some View {
        VStack(alignment: .leading) {
            Text(Title.buyerInfo)
                .font(.system(size: 22, weight: .medium))
                .padding(.bottom, 16)

            VStack(alignment: .leading) {
                Text(Title.numberPhone)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                    .padding(.top, 10)
                    .padding(.leading)

                TextField("+7 (***) ***-**-**", text: $phoneNumber)
                    .font(.system(size: 16, weight: .regular))
                    .keyboardType(.numberPad)
                    .textContentType(.telephoneNumber)
                    .padding(.leading)
                    .padding(.bottom, 10)
            }
            .background(Color(hex: Colors.background).cornerRadius(10))

            VStack(alignment: .leading) {
                Text(Title.mail)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                    .padding(.top, 10)
                    .padding(.leading)

                TextField(Title.mailPlaceholder, text: $emailText)
                    .font(.system(size: 16, weight: .regular))
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .padding(.leading)
                    .padding(.bottom, 10)
            }
            .background(Color(hex: Colors.background).cornerRadius(10))

            Text(Title.privateText)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(hex: Colors.gray))
        }
        .modifier(ConfigView())
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
        .modifier(ConfigView())
    }

    private func makeAddTouristSection() -> some View {
        VStack {
            ForEach(0..<views.count, id: \.self) { numberTourist in
                NextTouristView(tittleTourist: viewModel.getNumberTourist(numberTourist))
                    .modifier(ConfigView())
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
            .modifier(ConfigView())
        }
    }

    private func makeFinalPriceSection(_ booking: BookingModel) -> some View {
        VStack(spacing: 16) {
            PriceView(firstText: Title.tour, secondText: booking.tourPrice)
            PriceView(firstText: Title.fuelCharge, secondText: booking.fuelCharge)
            PriceView(firstText: Title.serviceCharge, secondText: booking.serviceCharge)

            HStack(alignment: .top) {
                Text(Title.finalPrice)
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Colors.gray))

                Spacer()

                Text("\(viewModel.getFinalPrice().formatted()) \(Title.rub)")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(hex: Colors.blue))
            }
        }
        .modifier(ConfigView())
    }

    private struct ConfigView: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding()
                .background(Color.white)
                .cornerRadius(12)
        }
    }
}
