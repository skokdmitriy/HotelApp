//
//  HotelView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct HotelView: View {
    @EnvironmentObject private var viewModel: HotelViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    if let hotel = viewModel.hotel {
                        DescriptionHotelView(hotel: hotel)
                        AboutHotelView(hotel: hotel)
                        makeDetailsSection()
                    }
                }
                .padding(.horizontal)
                .background(Color.gray)
            }
            .navigationBarTitle(Tittle.hotel, displayMode: .inline)
        }

        Button {
        } label: {
            Text(Tittle.titleButtonHotel)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .padding(.horizontal)
    }

    private func makeDetailsSection() -> some View {
        ForEach(viewModel.details, id: \.self) { detailsModel in
            DetailsSectionView(detailsModel: detailsModel)
        }
    }
}

#Preview {
    HotelView()
}
