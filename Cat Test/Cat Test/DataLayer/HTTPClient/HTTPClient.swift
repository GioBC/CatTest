//
//  HTTPClient.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
import UIKit

typealias ServiceResult<Success> = Swift.Result<Success, HTTPClientError>

protocol HTTPClient {
    func request<T: Codable>(url: URLRequest, completion: @escaping (ServiceResult<T>) -> Void)
}

enum HTTPClientError: Swift.Error {
    case connectivity
    case serviceError
    case errorParser
    case badURL
}
