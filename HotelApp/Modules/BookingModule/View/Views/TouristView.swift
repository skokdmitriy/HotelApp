//
//  TouristView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 24.12.2023.
//

import SwiftUI

struct TouristView: View {
    @State var name = ""
    @State var familyName = ""
    @State var brithDate = ""
    @State var nationality = ""
    @State var passportNumber = ""
    @State var passportDateStop = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text(Title.name)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                .padding(.top, 10)
                .padding(.leading)

            TextField("", text: $name)
                .font(.system(size: 16, weight: .regular))
                .textContentType(.name)
                .padding(.leading)
                .padding(.bottom, 10)
        }
        .background(Color(hex: Colors.background).cornerRadius(10))

        VStack(alignment: .leading) {
            Text(Title.familyName)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                .padding(.top, 10)
                .padding(.leading)

            TextField("", text: $familyName)
                .font(.system(size: 16, weight: .regular))
                .textContentType(.familyName)
                .padding(.leading)
                .padding(.bottom, 10)
        }
        .background(Color(hex: Colors.background).cornerRadius(10))

        TextField(Title.brithDate, text: $brithDate)
            .keyboardType(.numberPad)
            .modifier(ConfigTextField())

        TextField(Title.nationality, text: $nationality)
            .modifier(ConfigTextField())

        TextField(Title.passportNumber, text: $passportNumber)
            .keyboardType(.numberPad)
            .modifier(ConfigTextField())

        TextField(Title.passportDateStop, text: $passportDateStop)
            .keyboardType(.numberPad)
            .modifier(ConfigTextField())
    }

    private struct ConfigTextField: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(size: 16, weight: .regular))
                .padding()
                .background(Color(hex: Colors.background).cornerRadius(10))
        }
    }
}
