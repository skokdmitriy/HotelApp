//
//  RoomsView.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 20.12.2023.
//

import SwiftUI

struct RoomsView: View {
    @EnvironmentObject private var viewModel: RoomsViewModel
    @State var title: String

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.rooms, id: \.self) { room in
                    RoomView(room: room)
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
    }
}
    //#Preview {
    //    RoomView()
    //}
