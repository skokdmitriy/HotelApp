//
//  NumberPhoneMaskView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 23.12.2023.
//

import SwiftUI

struct DetailsView: View {
    let firstText: String
    let secondText: String
    
    var body: some View {
            HStack(alignment: .top){
                Text(firstText)
                    .frame(width: UIScreen.main.bounds.width / 3,alignment: .leading)
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Colors.gray))

                Text(secondText)
                    .font(.system(size: 16))
                Spacer()
            }
    }
}

#Preview {
    DetailsView(firstText: "Вылет", secondText: "Египет, Хургада")
}
