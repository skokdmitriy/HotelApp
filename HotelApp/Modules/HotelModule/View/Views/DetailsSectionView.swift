//
//  DetailsSectionView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

struct DetailsSectionView: View {
    let detailsModel: DetailsSectionModel

    var body: some View {
        HStack(alignment: .center) {
            Image(detailsModel.icon)
            VStack(alignment: .leading) {
                Text(detailsModel.title)
                    .font(.system(size: 16, weight: .medium))
                Text(detailsModel.subtitle)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: Colors.gray))
                Divider()
            }

            Spacer()
            Image(systemName: Icons.chevronRight)
        }
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    DetailsSectionView(detailsModel: DetailsSectionModel(icon: Icons.happy, title: "Удобства", subtitle: "Самое необходимое"))
}
