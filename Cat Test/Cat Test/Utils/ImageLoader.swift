//
//  ImageLoader.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
import UIKit

protocol ImageLoaderProtocol {
    func loadImage(url: URL, completion: @escaping (UIImage) -> Void)
}

class ImageLoader: ImageLoaderProtocol {
    /// Load and Image async
    /// - Parameters:
    ///   - url: an URL with url String from the service
    ///   - completion: gets the image loaded
    func loadImage(url: URL, completion: @escaping (UIImage) -> Void) {
        guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
            return
        }
        completion(image)
    }
}
