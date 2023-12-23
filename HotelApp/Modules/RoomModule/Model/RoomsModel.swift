//
//  RoomsModel.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 22.12.2023.
//

import Foundation

// MARK: - Rooms
struct RoomsModel: Decodable {
    let rooms: [RoomModel]
}

// MARK: - Room
struct RoomModel: Decodable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [URL]
}
