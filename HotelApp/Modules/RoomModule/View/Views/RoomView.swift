//
//  RoomView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 23.12.2023.
//

import SwiftUI

struct RoomView: View {
    let room: RoomModel

    var body: some View {
        VStack(alignment: .leading) {
            makeImageSliderSection()
            Text(room.name)
                .font(.system(size: 22))
            makeTagsView()

            Button {
            } label: {
                HStack {
                    Text(Title.titleButtonAboutRoom)
                    Text(Image(systemName: Icons.chevronRight))
                }
                .font(.system(size: 16, weight: .medium))
            }
            .padding(5)
            .buttonStyle(.borderless)
            .background(Color(hex: Colors.blue).opacity(0.1))
            .cornerRadius(5)

            makePriceSection()

            Button {
            } label: {
                Text(Title.titleButtonRoom)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }

    private func makeImageSliderSection() -> some View {
        ImageSlider(imageUrls: room.imageUrls)
            .frame(height: 257)
    }

    private func makeTagsView() -> some View {
        TagsView(availableWidth: UIScreen.main.bounds.width,
                 data: room.peculiarities, spacing: 5,
                 alignment: .leading
        ) { item in
            Text(verbatim: item)
                .frame(height: 29)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.gray))
                .background(Color(hex: Colors.backgroundTag))
                .cornerRadius(5)
        }
    }

    private func makePriceSection() -> some View {
        HStack(alignment: .bottom) {
            Text("\(room.price.formatted(.number.locale(.init(identifier: "fr_FR")))) ₽")
                .font(.system(size: 30, weight: .semibold))
            Text(room.pricePer)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.gray))
        }
    }
}

//#Preview {
//    RoomView()
//}
