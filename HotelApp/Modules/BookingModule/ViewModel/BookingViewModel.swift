//
//  BookingViewModel.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 23.12.2023.
//

import SwiftUI
import Combine

final class BookingViewModel: ObservableObject  {
    private let networkService = NetworkService()
    @Published var booking: BookingModel?
    @State private var cancellables = Set<AnyCancellable>()

    init() {
        loadBooking()
    }

    private func loadBooking() {
        networkService.fetchBooking()
            .subscribe(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Request finished")
                case .failure(let error):
                    print("Request failed: \(error)")
                }
            } receiveValue: { [weak self] booking in
                self?.booking = booking
            }
            .store(in: &cancellables)
    }

    func getNumberTourist(_ numberTourist: Int) -> String {
        switch numberTourist {
        case 0:
            Title.secondTourist
        case 1:
            Title.thirdTourist
        default:
            "default"
        }
    }

    func getFinalPrice() -> Int {
        guard let booking else {
            return 0
        }
        let finalPrice = booking.tourPrice + booking.fuelCharge + booking.serviceCharge
        return finalPrice
    }
}
