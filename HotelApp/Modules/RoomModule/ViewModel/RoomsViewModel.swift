//
//  RoomsViewModel.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 22.12.2023.
//

import SwiftUI
import Combine

final class RoomsViewModel: ObservableObject {
    private let networkService = NetworkService()
    @Published var rooms: [RoomModel] = []
    @Published var imagesRoom: [UIImage] = []
    @State private var cancellables = Set<AnyCancellable>()

    init() {
        loadRooms()
    }
    
    private func loadRooms() {
        networkService.fetchRooms()
            .subscribe(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Request finished")
                case .failure(let error):
                    print("Request failed: \(error)")
                }
            } receiveValue: { [weak self] rooms in
                self?.rooms = rooms.rooms
            }
            .store(in: &cancellables)
    }
}
