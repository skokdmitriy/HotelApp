//
//  NetworkService.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 17.12.2023.
//

import UIKit
import Combine

enum ApiError: Error {
    case badUrl
    case networkError
    case invalidFormatError
}

final class NetworkService {

    public func fetchHotel() -> AnyPublisher<HotelModel, ApiError> {
        request(API.urlHotel)
    }

   private func request<T:Decodable>(_ url: String) -> AnyPublisher<T, ApiError> {
        guard let url = URL(string: url) else {
            return Fail(error: ApiError.badUrl).eraseToAnyPublisher()
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .mapError {
                if let error = $0 as? ApiError {
                    return error
                }
                return .invalidFormatError
            }
            .eraseToAnyPublisher()
    }
}
