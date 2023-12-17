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
                    makeDescriptionHotelSection()
                    makeAboutHotelSection()
                    makeDetailsSection()
                }
                .padding(.horizontal)
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

    private func makeDescriptionHotelSection() -> some View {
        DescriptionHotelView()
    }

    private func makeAboutHotelSection() -> some View {
        AboutHotelView()
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
