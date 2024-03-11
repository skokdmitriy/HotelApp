//
//  HotelView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct HotelView: View {
    @EnvironmentObject private var viewModel: HotelViewModel
    @State private var isActivateRootLink = false

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: Constants.generalSpacing) {
                    if let hotel = viewModel.hotel {
                        makeDescriptionHotelSection(hotel: hotel)
                        makeAboutHotelSection(hotel: hotel)
                    }

                    VStack(spacing: .zero) {
                        Divider()

                        NavigationLink(destination: destinationRoomView(),
                                       isActive: $isActivateRootLink,
                                       label: {
                            Text(Title.buttonHotel)
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(.borderedProminent)
                        .padding(.top, Constants.buttonPaddingTop)
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                }
                .navigationBarTitle(Title.hotel, displayMode: .inline)
                .background(Color(hex: Colors.backgroundScreen))
            }
        }
    }

    private func makeDescriptionHotelSection(hotel: HotelModel) -> some View {
        VStack(alignment: .leading) {
            CustomPageView(imageUrls: hotel.imageUrls)
                .frame(height: UIScreen.main.bounds.height / Constants.imageSliderHeight)
                .padding([.horizontal, .bottom])

            RatingView(ratingCount: hotel.rating, ratingName: hotel.ratingName)
                .padding(.horizontal)

            Text(hotel.name)
                .font(.system(size: Constants.nameSize, weight: .medium))
                .padding(.vertical, Constants.namePadding)
                .padding(.horizontal)

            Text(hotel.adress)
                .font(.system(size: Constants.adressSize, weight: .medium))
                .foregroundColor(Color(hex: Colors.blue))
                .padding(.horizontal)

            HStack(alignment: .bottom, spacing: Constants.priceSpacing) {
                Text("\(Title.from) \(hotel.minimalPrice.formatted()) \(Title.rub)")
                    .font(.system(size: Constants.minimalPriceSize, weight: .semibold))

                Text(hotel.priceForIt)
                    .font(.system(size: Constants.priceForItSize, weight: .regular))
                    .foregroundColor(Color(hex: Colors.gray))
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(Constants.cornerRadius, corners: .bottomLeft)
        .cornerRadius(Constants.cornerRadius, corners: .bottomRight)
    }

    private func makeAboutHotelSection(hotel: HotelModel) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(Title.aboutHotel)
                    .font(.system(size: Constants.aboutHotelSize, weight: .medium))
                    .padding()

                Spacer()
            }

            TagsView(availableWidth: UIScreen.main.bounds.width,
                     data: hotel.aboutTheHotel.peculiarities, spacing: Constants.tagsViewSpacing,
                     alignment: .leading
            ) { item in
                Text(verbatim: item)
                    .font(.system(size: Constants.tagsSize, weight: .medium))
                    .foregroundColor(Color(hex: Colors.gray))
                    .padding(.vertical, Constants.tagsPaddingVertical)
                    .padding(.horizontal, Constants.tagsPaddingHorizontal)
                    .background(Color(hex: Colors.backgroundTag))
                    .cornerRadius(Constants.tagsCornerRadius)
            }
            .padding(.horizontal)

            Text(hotel.aboutTheHotel.description)
                .font(.system(size: Constants.aboutTheHotelSize, weight: .regular))
                .padding(.top, Constants.aboutTheHotelPaddingTop)
                .padding(.horizontal)

            makeDetailsSection()
                .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(Constants.cornerRadius)
    }

    private func makeDetailsSection() -> some View {
        VStack {
            DetailsSectionView(icon: Icons.happy,
                               title: Title.detailsHappy,
                               subtitle: Title.detailsSubtitle,
                               isShowDivider: true
            )
            DetailsSectionView(icon: Icons.tick,
                               title: Title.detailsTick,
                               subtitle: Title.detailsSubtitle,
                               isShowDivider: true
            )
            DetailsSectionView(icon: Icons.close,
                               title: Title.detailsClose,
                               subtitle: Title.detailsSubtitle,
                               isShowDivider: false
            )
        }
        .padding(.vertical, Constants.detailsSectionPadding)
        .background(Color(hex: Colors.backgroundTag))
        .cornerRadius(Constants.detailsSectionCornerRadius)
        .padding(.horizontal)
    }

    private func destinationRoomView() -> some View {
        return RoomsView(isActivateRootLink: $isActivateRootLink,
                         title: viewModel.hotel?.name ?? Title.defaultTitleRoom
        )
        .environmentObject(RoomsViewModel())
    }
}

private enum Constants {
    static let generalSpacing: CGFloat = 12
    static let buttonPaddingTop: CGFloat = 12
    static let imageSliderHeight: CGFloat = 3
    static let nameSize: CGFloat = 22
    static let namePadding: CGFloat = 8
    static let adressSize: CGFloat = 14
    static let priceSpacing: CGFloat = 8
    static let minimalPriceSize: CGFloat = 30
    static let priceForItSize: CGFloat = 16
    static let cornerRadius: CGFloat = 12
    static let aboutHotelSize: CGFloat = 22
    static let tagsViewSpacing: CGFloat = 8
    static let tagsSize: CGFloat = 16
    static let tagsPaddingVertical: CGFloat = 5
    static let tagsPaddingHorizontal: CGFloat = 10
    static let tagsCornerRadius: CGFloat = 5
    static let aboutTheHotelSize: CGFloat = 16
    static let aboutTheHotelPaddingTop: CGFloat = 12
    static let detailsSectionPadding: CGFloat = 15
    static let detailsSectionCornerRadius: CGFloat = 15
}
