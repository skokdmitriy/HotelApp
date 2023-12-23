//
//  BookingModel.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 23.12.2023.
//

import Foundation

struct BookingModel: Decodable {
    let id: Int
    let hotelName: String
    let hotelAdress: String
    let horating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
}
