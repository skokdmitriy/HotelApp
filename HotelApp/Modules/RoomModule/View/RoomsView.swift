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
            ScrollView {
                ForEach(viewModel.rooms, id: \.self) { room in
                    RoomView(room: room)
                    NavigationLink {
                        BookingView(isActivateRootLink: $isActivateRootLink)
                        .environmentObject(BookingViewModel())
                    } label: {
                        Text(Title.buttonRoom)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)



//                    Button {
//
//                    } label: {
//                        Text(Title.buttonRoom)
//                            .frame(maxWidth: .infinity)
//                    }
//                    .buttonStyle(.borderedProminent)
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }

            .navigationBarTitle(title, displayMode: .inline)
        }
    }

    //#Preview {
    //    RoomView()
    //}
