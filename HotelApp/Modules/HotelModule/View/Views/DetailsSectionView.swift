//
//  DetailsSectionView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

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
                    .font(.system(size: 16, weight: .medium))
                Text(subtitle)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: Colors.gray))

                if isShowDivider {
                    Divider()
                }
            }
            
            if !isShowDivider {
                Spacer()
            }
            Image(systemName: Icons.chevronRight)
                .offset(x: -25)
        }
        .cornerRadius(15)
        .padding(.leading, 15)
    }
}
