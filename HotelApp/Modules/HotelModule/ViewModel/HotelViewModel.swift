//
//  HotelViewModel.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 16.12.2023.
//

import SwiftUI
import Combine

final class HotelViewModel: ObservableObject {
    
    private let networkService = NetworkService()
    @Published var hotel: HotelModel?
    @State private var cancellables = Set<AnyCancellable>()
    
    //    init() {
    //        loadHotel()
    //    }
    
    func loadHotel() {
        networkService.fetchHotel()
            .subscribe(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Request finished loadHotel")
                case .failure(let error):
                    print("Request failed: \(error)")
                }
            } receiveValue: { [weak self] hotel in
                self?.hotel = hotel
            }
            .store(in: &cancellables)
    }
}
