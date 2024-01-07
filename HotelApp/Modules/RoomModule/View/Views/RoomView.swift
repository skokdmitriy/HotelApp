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
            ImageSlider(imageUrls: room.imageUrls)
                .frame(height: UIScreen.main.bounds.height / Constants.imageSliderHeight)
                .padding(.top, Constants.imageSliderPaddingTop)

            Text(room.name)
                .font(.system(size: Constants.nameFontSize, weight: .medium))

            TagsView(availableWidth: UIScreen.main.bounds.width,
                     data: room.peculiarities,
                     spacing: Constants.tagsViewSpacing,
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

            Button {
            } label: {
                HStack {
                    Text(Title.buttonAboutRoom)
                    Text(Image(systemName: Icons.chevronRight))
                }
                .frame(minWidth: Constants.buttonAboutRoomMinWidth)
                .frame(height: Constants.buttonAboutRoomHeight)
                .font(.system(size: Constants.buttonAboutRoomFontSize, weight: .medium))
            }

            .buttonStyle(.borderless)
            .background(Color(hex: Colors.blue).opacity(Constants.buttonColorOpacity))
            .cornerRadius(Constants.buttonCornerRadius)

            HStack(alignment: .bottom) {
                Text("\(room.price.formatted()) \(Title.rub)")
                    .font(.system(size: Constants.priceFontSize, weight: .semibold))

                Text(room.pricePer)
                    .font(.system(size: Constants.pricePerFontSize, weight: .regular))
                    .foregroundColor(Color(hex: Colors.gray))
            }
            .padding(.top, Constants.pricePaddingTop)
        }
        .padding(.horizontal)
    }
}

private enum Constants {
    static let imageSliderHeight: CGFloat = 3
    static let imageSliderPaddingTop: CGFloat = 16
    static let nameFontSize: CGFloat = 22
    static let tagsViewSpacing: CGFloat = 8
    static let tagsSize: CGFloat = 16
    static let tagsPaddingVertical: CGFloat = 5
    static let tagsPaddingHorizontal: CGFloat = 10
    static let tagsCornerRadius: CGFloat = 5
    static let buttonAboutRoomFontSize: CGFloat = 16
    static let buttonAboutRoomMinWidth: CGFloat = 192
    static let buttonAboutRoomHeight: CGFloat = 29
    static let buttonCornerRadius: CGFloat = 5
    static let buttonColorOpacity: CGFloat = 0.1
    static let priceFontSize: CGFloat = 30
    static let pricePerFontSize: CGFloat = 16
    static let pricePaddingTop: CGFloat = 8
}
