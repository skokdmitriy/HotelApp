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
                VStack(spacing: 12) {
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
                        .padding(.top, 12)
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
            ImageSlider(imageUrls: hotel.imageUrls)
                .frame(height: UIScreen.main.bounds.height / 3)
                .padding([.horizontal, .bottom])

            RatingView(ratingCount: hotel.rating, ratingName: hotel.ratingName)
                .padding(.horizontal)

            Text(hotel.name)
                .font(.system(size: 22, weight: .medium))
                .padding(.vertical, 8)
                .padding(.horizontal)
            Text(hotel.adress)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(hex: Colors.blue))
                .padding(.horizontal)

            HStack(alignment: .bottom, spacing: 8) {
                Text("от \(hotel.minimalPrice.formatted()) ₽")
                    .font(.system(size: 30, weight: .semibold))
                Text(hotel.priceForIt)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(hex: Colors.gray))
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(12, corners: .bottomLeft)
        .cornerRadius(12, corners: .bottomRight)
    }

    private func makeAboutHotelSection(hotel: HotelModel) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(Title.aboutHotel)
                    .font(.system(size: 22, weight: .medium))
                    .padding()
                Spacer()
            }

            TagsView(availableWidth: UIScreen.main.bounds.width,
                     data: hotel.aboutTheHotel.peculiarities, spacing: 8,
                     alignment: .leading
            ) { item in
                Text(verbatim: item)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color(hex: Colors.gray))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color(hex: Colors.backgroundTag))
                    .cornerRadius(5)
            }
            .padding(.horizontal)

            Text(hotel.aboutTheHotel.description)
                .font(.system(size: 16, weight: .regular))
                .padding(.top, 12)
                .padding(.horizontal)

            makeDetailsSection()
                .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(12)
    }

    private func makeDetailsSection() -> some View {
        VStack {
            DetailsSectionView(icon: Icons.happy,
                               title: "Удобства",
                               subtitle: "Самое необходимое",
                               isShowDivider: true
            )
            DetailsSectionView(icon: Icons.tick,
                               title: "Что включено",
                               subtitle: "Самое необходимое",
                               isShowDivider: true
            )
            DetailsSectionView(icon: Icons.close,
                               title: "Что не включено",
                               subtitle: "Самое необходимое",
                               isShowDivider: false
            )
        }
        .padding(.vertical, 15)
        .background(Color(hex: Colors.backgroundTag))
        .cornerRadius(15)
        .padding(.horizontal)
    }

    private func destinationRoomView() -> some View {
        return RoomsView(isActivateRootLink: $isActivateRootLink, title: viewModel.hotel?.name ?? "room").environmentObject(RoomsViewModel())
    }
}
