//
//  URLSessionHTTPClient.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
import UIKit

class URLSessionHTTPClient: HTTPClient {
    
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(url: URLRequest, completion: @escaping (ServiceResult<T>) -> Void) where T : Decodable, T : Encodable {
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(.connectivity))
            } else if let data = data {
                self.parse(data: data, type: T.self, completion: completion)
            } else {
                completion(.failure(.serviceError))
            }
        }.resume()
        
    }
    
    func parse<T>(data: Data, type: T.Type, completion: @escaping (ServiceResult<T>) -> Void) where T: Codable {
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            completion(.success(json))
        } catch {
            print("[Error parsing]")
            print(error)
            completion(.failure(.errorParser))
        }
    }
    
    
}
