//
//  PaymentView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 25.12.2023.
//

import SwiftUI

struct PaymentView: View {
    @Binding var isActivateRootLink: Bool

    var body: some View {
            VStack(spacing: 16) {

                Spacer()

                Image(Images.pay)
                Text(Title.orderForWork)
                    .font(.system(size: 22, weight: .medium))
                Text(Title.decriptionOrder)
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Colors.gray))
                    .multilineTextAlignment(.center)

                Spacer()

                Divider()
                
                Button {
                    isActivateRootLink = false
                } label: {
                    Text(Title.paymentButton)
                        .modifier(PrimaryButtons())
                }
            }
            .padding()
            .navigationBarTitle(Title.payment, displayMode: .inline)
    }
}
