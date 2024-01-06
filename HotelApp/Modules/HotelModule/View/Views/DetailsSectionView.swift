//
//  DetailsSectionView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

private enum Constants {
    static let titleFountSize: CGFloat = 16
    static let subTitleFontSize: CGFloat = 14
    static let imageChevronOffset: CGFloat = -25
    static let cornerRadius: CGFloat = 15
    static let paddingLeading: CGFloat = 15
}

struct DetailsSectionView: View {
    let icon: String
    let title: String
    let subtitle: String
    let isShowDivider: Bool

    var body: some View {
        HStack(alignment: .center) {
            Image(icon)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: Constants.titleFountSize, weight: .medium))

                Text(subtitle)
                    .font(.system(size: Constants.subTitleFontSize, weight: .medium))
                    .foregroundColor(Color(hex: Colors.gray))

                if isShowDivider {
                    Divider()
                }
            }
            
            if !isShowDivider {
                Spacer()
            }
            Image(systemName: Icons.chevronRight)
                .offset(x: Constants.imageChevronOffset)
        }
        .cornerRadius(Constants.cornerRadius)
        .padding(.leading, Constants.paddingLeading)
    }
}
