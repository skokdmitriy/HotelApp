//
//  PriceView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 24.12.2023.
//

import SwiftUI

struct PriceView: View {
    let firstText: String
    let secondText: Int

    var body: some View {
        HStack(alignment: .top) {
            Text(firstText)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: Colors.gray))

            Spacer()

            Text("\(secondText.formatted()) \(Title.rub)")
                .font(.system(size: 16, weight: .regular))
        }
    }
}
