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
        HStack(alignment: .center){
            Image(detailsModel.icon)
            VStack(alignment: .leading) {
                Text(detailsModel.title)
                    .font(.system(size: 16))
                Text(detailsModel.subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: Colors.gray))
            }
            Spacer()
            Image(Icons.chevron)
        }
        Divider()
    }
}

#Preview {
    DetailsSectionView(detailsModel: DetailsSectionModel(icon: Icons.happy, title: "Удобства", subtitle: "Самое необходимое"))
}
