//
//  HotelModel.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import Foundation

struct HotelModel: Decodable {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [URL]
    let aboutTheHotel: AboutTheHotel
}

// MARK: - AboutTheHotel
struct AboutTheHotel: Decodable {
    let description: String
    let peculiarities: [String]
}

struct DetailsSectionModel: Hashable {
    let icon: String
    let title: String
    let subtitle: String
}

struct User {
    var id: UUID
    var name: String

    static let def = User(id: UUID(), name: "anonumus")
}
