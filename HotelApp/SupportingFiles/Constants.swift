//
//  Constants.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import Foundation

public enum API {
    static let urlHotel = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    static let urlRoom = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    static let urlBooking = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
}

public enum Title {
    static let hotel = "Отель"
    static let titleButtonHotel = "К выбору номера"
    static let aboutHotel = "Об отеле"
    static let titleButtonAboutRoom = "Подробнее о номере"
    static let titleButtonRoom = "Выбрать номер"
}

public enum Colors {
    static let backgroundRating = "#FFC700"
    static let textColorRating = "#FFA800"
    static let blue = "#0D72FF"
    static let gray = "#828796"
    static let backgroundTag = "#FBFBFC"
}

public enum Icons {
    static let close = "IconCloseSquare"
    static let happy = "IconHappy"
    static let tick = "IconTickSquare"
    static let chevronRight = "chevron.right"
    static let failureLoadImage = "xmark.circle.fill"
    static let star = "star.fill"
}
