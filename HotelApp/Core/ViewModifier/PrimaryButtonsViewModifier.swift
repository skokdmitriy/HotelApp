//
//  PrimaryButtonsViewModifier.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 11.03.2024.
//

import SwiftUI

struct PrimaryButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .medium))
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(15)
    }
}
