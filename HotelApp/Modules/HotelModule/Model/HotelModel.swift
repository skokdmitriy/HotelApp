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
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [URL]
    let aboutTheHotel: AboutTheHotel
}

struct AboutTheHotel: Decodable {
    let description: String
    let peculiarities: [String]
}
