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
            ScrollView {
                if let hotel = viewModel.hotel {
                    DescriptionHotelView(hotel: hotel)
                    AboutHotelView(hotel: hotel)
                    makeDetailsSection()
                        .padding(.horizontal)
                }

                NavigationLink(destination: destinationRoomView(),
                               isActive: $isActivateRootLink,
                               label: {
                    Text(Title.buttonHotel)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
            }
            .navigationBarTitle(Title.hotel, displayMode: .inline)
        }
    }

    private func makeDetailsSection() -> some View {
        ForEach(viewModel.details, id: \.self) { detailsModel in
            DetailsSectionView(detailsModel: detailsModel)
        }
    }

    private func destinationRoomView() -> some View {
        return RoomsView(isActivateRootLink: $isActivateRootLink, title: viewModel.hotel?.name ?? "room").environmentObject(RoomsViewModel())
    }
}

#Preview {
    HotelView()
}
