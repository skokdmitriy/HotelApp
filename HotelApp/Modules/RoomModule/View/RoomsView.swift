//
//  RoomsView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 20.12.2023.
//

import SwiftUI

struct RoomsView: View {
    @EnvironmentObject private var viewModel: RoomsViewModel
    @Binding var isActivateRootLink: Bool
    @State var title: String

    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.rooms, id: \.self) { room in
                VStack(spacing: .zero) {
                    RoomView(room: room)

                    NavigationLink {
                        BookingView(isActivateRootLink: $isActivateRootLink)
                            .environmentObject(BookingViewModel())
                    } label: {
                        Text(Title.buttonRoom)
                            .modifier(PrimaryButtons())
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(Constants.cornerRadius)
                .offset(y: Constants.offset)
            }
            .background(Color(hex: Colors.backgroundScreen))
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text (title)
                    .bold ()
                    .multilineTextAlignment(.center)
                    .lineLimit (Constants.titleTextLineLimit)
                    .fixedSize (horizontal: false, vertical: true)
            }
        }
        .padding(.vertical)
    }
}

private enum Constants {
    static let cornerRadius: CGFloat = 12
    static let offset: CGFloat = 8
    static let titleTextLineLimit: Int = 2
}
