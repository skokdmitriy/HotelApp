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
    @Published var details: [DetailsSectionModel] = []
    @Published var hotel: HotelModel?
    @Published var images: [UIImage] = []
    @State private var cancellables = Set<AnyCancellable>()

    init() {
        makeDetails()
        loadHotel()
    }

    func loadHotel() {
        networkService.fetchHotel()
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Request finished")
                case .failure(let error):
                    print("Request failed: \(error)")
                }
            } receiveValue: { [weak self] hotel in
                self?.hotel = hotel
            }
            .store(in: &cancellables)
    }


    private func makeDetails() {
        details.append(DetailsSectionModel(icon: Icons.happy,
                                           title: "Удобства",
                                           subtitle: "Самое необходимое")
        )
        details.append(DetailsSectionModel(icon: Icons.tick,
                                           title: "Что включено",
                                           subtitle: "Самое необходимое")
        )
        details.append(DetailsSectionModel(icon: Icons.close,
                                           title: "Что не включено",
                                           subtitle: "Самое необходимое"))
    }
}

