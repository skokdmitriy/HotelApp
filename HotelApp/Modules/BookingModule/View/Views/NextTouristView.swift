//
//  NextTouristView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 24.12.2023.
//

import SwiftUI

struct NextTouristView: View {
    var tittleTourist: String
    @State var name = ""
    @State var familyName = ""
    @State var brithDate = ""
    @State var nationality = ""
    @State var passportNumber = ""
    @State var passportDateStop = ""
    @State private var isState = false
    @State private var rotationAngle: Double = 0

    var body: some View {
        VStack {
            HStack {
                Text(tittleTourist)
                    .font(.system(size: 22, weight: .medium))
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        rotationAngle -= 180
                        isState.toggle()
                    }
                } label: {
                    Image(systemName: Icons.chevronUp)
                        .rotationEffect((Angle(degrees: rotationAngle)))
                }
                .frame(width: 32, height: 32, alignment: .center)
                .buttonStyle(.borderless)
                .background(Color(hex: Colors.blue).opacity(0.1))
                .cornerRadius(6)
            }
            
            if isState == false {
                
                VStack(alignment: .leading) {
                    Text(Title.name)
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                        .padding(.top, 10)
                        .padding(.leading, 16)

                    TextField("", text: $name)
                        .textContentType(.name)
                        .padding(.leading, 16)
                        .padding(.bottom, 10)
                }
                .background(Color(hex: Colors.background).cornerRadius(10))

                VStack(alignment: .leading) {
                    Text(Title.familyName)
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: Colors.textFieldPlaceholder))
                        .padding(.top, 10)
                        .padding(.leading, 16)

                    TextField("", text: $familyName)
                        .textContentType(.familyName)
                        .padding(.leading, 16)
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
        }
    }
}


struct ConfigTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(hex: Colors.background).cornerRadius(10))
    }
}
