//
//  HotelAppApp.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI

@main
struct HotelAppApp: App {
    var body: some Scene {
        WindowGroup {
            BookingView().environmentObject(BookingViewModel())
//            HotelView().environmentObject(HotelViewModel())
//            RoomsView().environmentObject(RoomsViewModel())

        }
    }
}
