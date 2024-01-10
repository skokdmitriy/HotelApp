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
    static let buttonHotel = "К выбору номера"
    static let aboutHotel = "Об отеле"
    static let buttonAboutRoom = "Подробнее о номере"
    static let buttonRoom = "Выбрать номер"
    static let privateText = "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту"
    static let pay = "Оплатить"
    static let departure = "Вылет из"
    static let country = "Страна, город"
    static let date = "Даты"
    static let countNights = "Кол-во ночей"
    static let nights = "ночей"
    static let hotelName = "Отель"
    static let room = "Номер"
    static let nutrition = "Питание"
    static let buyerInfo = "Информация о покупателе"
    static let numberPhone = "Номер телефона"
    static let mail = "Почта"
    static let mailPlaceholder = "@mail.ru"
    static let firstTourist = "Первый турист"
    static let secondTourist = "Второй турист"
    static let thirdTourist = "Третий турист"
    static let addTourist = "Добавить туриста"
    static let tour = "Тур"
    static let fuelCharge = "Топливный сбор"
    static let serviceCharge = "Сервисный сбор"
    static let finalPrice = "К оплате"
    static let name = "Имя"
    static let familyName = "Фамилия"
    static let brithDate = "Дата рождения"
    static let nationality = "Гражданство"
    static let passportNumber = "Номер загранпаспорта"
    static let passportDateStop = "Срок действия загранпаспорта"
    static let booking = "Бронирование"
    static let orderForWork = "Ваш заказ принят в работу"
    static let decriptionOrder = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    static let payment = "Заказ оплачен"
    static let paymentButton = "Супер!"
    static let from = "от"
    static let rub = "₽"

    static let detailsHappy = "Удобства"
    static let detailsTick = "Что включено"
    static let detailsClose = "Что не включено"
    static let detailsSubtitle = "Самое необходимое"
    static let defaultTitleRoom = "room"
    static let maskPhoneNumber = "+ 7 ( *** ) *** - ** - **"
}

public enum Colors {
    static let backgroundRating = "#FFC700"
    static let textColorRating = "#FFA800"
    static let blue = "#0D72FF"
    static let gray = "#828796"
    static let backgroundTag = "#FBFBFC"
    static let background = "#F6F6F9"
    static let textFieldPlaceholder = "#A9ABB7"
    static let backgroundScreen = "#F1F1F1"
}

public enum Icons {
    static let close = "IconCloseSquare"
    static let happy = "IconHappy"
    static let tick = "IconTickSquare"
    static let chevronRight = "chevron.right"
    static let chevronUp = "chevron.up"
    static let failureLoadImage = "xmark.circle.fill"
    static let star = "star.fill"
    static let plus = "plus"
}

public enum Images {
    static let pay = "Pay"
}
