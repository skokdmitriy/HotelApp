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
    @State private var rotationAngle: Double = Constants.General.rotationAngle
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
                            .modifier(PrimaryButtons())
                    }
                    .padding(.top, Constants.General.paddingTopButton)
                    .padding(.horizontal)
                }
                .background(Color.white)
            }
            .offset(y: Constants.General.offset)
            .background(Color(hex: Colors.backgroundScreen))
            .navigationTitle(Title.booking)
        }
    }

    private func makeNameHotelSection(_ booking: BookingModel) -> some View {
        HStack {
            VStack(alignment: .leading) {
                RatingView(ratingCount: booking.horating, ratingName: booking.ratingName)

                Text(booking.hotelName)
                    .font(.system(size: Constants.HotelSection.nameSize, weight: .medium))

                Text(booking.hotelAdress)
                    .font(.system(size: Constants.HotelSection.adressSize, weight: .medium))
                    .foregroundColor(Color(hex: Colors.blue))
            }
            Spacer()
        }
        .modifier(ConfigView())
    }

    private func makeDetailsSection(_ booking: BookingModel) -> some View {
        VStack(spacing: Constants.DetailSection.stackSpacing) {
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
                .font(.system(size: Constants.InfoSection.buyerInfoSize, weight: .medium))
                .padding(.bottom)

            VStack(alignment: .leading) {
                Text(Title.numberPhone)
                    .modifier(TitleTextFieldModifier())

                TextField(Title.maskPhoneNumber, text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .textContentType(.telephoneNumber)
                    .modifier(TextFieldModifier())
            }
            .cornerRadius(Constants.InfoSection.cornerRadius)
            .background(Color(hex: Colors.background))

            VStack(alignment: .leading) {
                Text(Title.mail)
                    .modifier(TitleTextFieldModifier())

                TextField(Title.mailPlaceholder, text: $emailText)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .modifier(TextFieldModifier())

            }
            .cornerRadius(Constants.InfoSection.cornerRadius)
            .background(Color(hex: Colors.background))

            Text(Title.privateText)
                .font(.system(size: Constants.InfoSection.privateTextSize, weight: .regular))
                .foregroundColor(Color(hex: Colors.gray))
        }
        .modifier(ConfigView())
    }

    private func makeTouristSection() -> some View {
        VStack {
            HStack {
                Text(Title.firstTourist)
                    .font(.system(size: Constants.TouristSection.firstTouristSize, weight: .medium))

                Spacer()

                Button {
                    withAnimation(
                        .easeInOut(duration: Constants.TouristSection.animationDuration)) {
                            rotationAngle -= Constants.TouristSection.rotationAngle
                        isAnimationButton.toggle()
                    }
                } label: {
                    Image(systemName: Icons.chevronUp)
                        .rotationEffect((Angle(degrees: rotationAngle)))
                }
                .frame(width: Constants.TouristSection.ButtonFrameWidth,
                       height: Constants.TouristSection.ButtonFrameHeight,
                       alignment: .center)
                .background(Color(hex: Colors.blue).opacity(Constants.TouristSection.opacity))
                .cornerRadius(Constants.TouristSection.cornerRadiusButton)
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
            ForEach(.zero..<views.count, id: \.self) { numberTourist in
                NextTouristView(tittleTourist: viewModel.getNumberTourist(numberTourist))
                    .modifier(ConfigView())
            }

            HStack {
                Text(Title.addTourist)
                    .font(.system(size: Constants.AddTouristSection.touristTitleSize,
                                  weight: .medium))

                Spacer()

                Button {
                    withAnimation {
                        views.append(AnyView(TouristView()))
                    }
                } label: {
                    Image(systemName: Icons.plus)
                }
                .frame(width: Constants.AddTouristSection.ButtonFrameWidth,
                       height: Constants.AddTouristSection.ButtonFrameHeight,
                       alignment: .center)
                .buttonStyle(.borderedProminent)
                .cornerRadius(Constants.AddTouristSection.cornerRadiusButton)
                .disabled(views.count == Constants.AddTouristSection.maxTouristCount)
            }
            .modifier(ConfigView())
        }
    }

    private func makeFinalPriceSection(_ booking: BookingModel) -> some View {
        VStack(spacing: Constants.PriceSection.stackSpacing) {
            PriceView(firstText: Title.tour, secondText: booking.tourPrice)
            PriceView(firstText: Title.fuelCharge, secondText: booking.fuelCharge)
            PriceView(firstText: Title.serviceCharge, secondText: booking.serviceCharge)

            HStack(alignment: .top) {
                Text(Title.finalPrice)
                    .foregroundColor(Color(hex: Colors.gray))
                    .font(.system(size: Constants.PriceSection.finalPriceTitleSize,
                                  weight: .regular))

                Spacer()

                Text("\(viewModel.getFinalPrice().formatted()) \(Title.rub)")
                    .foregroundColor(Color(hex: Colors.blue))
                    .font(.system(size: Constants.PriceSection.finalPriceTitleSize,
                                  weight: .semibold))
            }
        }
        .modifier(ConfigView())
    }

    private struct ConfigView: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding()
                .background(Color.white)
                .cornerRadius(Constants.General.cornerRadius)
        }
    }

    private struct TitleTextFieldModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(size: Constants.General.titleTextFieldSize, weight: .regular))
                .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                .padding(.top, Constants.General.titleTextFieldPadding)
                .padding(.leading)
        }
    }

    private struct TextFieldModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(size: Constants.General.textFieldSize, weight: .regular))
                .padding(.leading)
                .padding(.bottom, Constants.General.titleTextFieldPadding)
        }
    }
}

private enum Constants {
    enum General {
        static let rotationAngle: Double = 0
        static let paddingTopButton: CGFloat = 12
        static let offset: CGFloat = 8
        static let cornerRadius: CGFloat = 12
        static let titleTextFieldSize: CGFloat = 12
        static let titleTextFieldPadding: CGFloat = 10
        static let textFieldSize: CGFloat = 16
    }

    enum HotelSection {
        static let nameSize: CGFloat = 22
        static let adressSize: CGFloat = 14
    }

    enum DetailSection {
        static let stackSpacing: CGFloat = 16
    }

    enum InfoSection {
        static let buyerInfoSize: CGFloat = 22
        static let numberPhoneSize: CGFloat = 12
        static let cornerRadius: CGFloat = 10
        static let privateTextSize: CGFloat = 14
    }

    enum TouristSection {
        static let firstTouristSize: CGFloat = 22
        static let animationDuration: CGFloat = 0.5
        static let rotationAngle: CGFloat = 180
        static let ButtonFrameWidth: CGFloat = 32
        static let ButtonFrameHeight: CGFloat = 32
        static let cornerRadiusButton: CGFloat = 6
        static let opacity: CGFloat = 0.1
    }

    enum AddTouristSection {
        static let touristTitleSize: CGFloat = 22
        static let ButtonFrameWidth: CGFloat = 32
        static let ButtonFrameHeight: CGFloat = 32
        static let cornerRadiusButton: CGFloat = 6
        static let maxTouristCount: Int = 2
    }

    enum PriceSection {
        static let stackSpacing: CGFloat = 16
        static let finalPriceTitleSize: CGFloat = 16
    }
}
