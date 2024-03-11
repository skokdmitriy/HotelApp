//
//  ImageCache.swift
//  HotelApp
//
//  Created by Дмитрий Скок
//

import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()

    private init() {}

    func loadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let downloadedImage = UIImage(data: data) else {
                    completion(nil)
                    return
                }

                self.cache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
                completion(downloadedImage)
            }.resume()
        }
    }
}
