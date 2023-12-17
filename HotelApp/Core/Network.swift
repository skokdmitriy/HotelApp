//
//  Network.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 17.12.2023.
//

import Foundation
import Combine

enum NetworkError: Error {
    case requestError
    case parsingError
}

final class Network {
    private var subscription = Set<AnyCancellable>()

    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .replaceError(with: defaultValue)
            .sink(receiveValue: completion)
            .store(in: &subscription)


    }
}
