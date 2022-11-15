//
//  CatAPI.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
import UIKit

typealias CatsResult = ServiceResult<Array<CatModel>>

protocol CatAPIProtocol {
    func getCats(completion: @escaping (CatsResult) -> Void)
}

class CatAPI: CatAPIProtocol {
    
    var httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    /// get All the cats from the serrvice
    /// - Parameter completion: get a result type with an array of models
    func getCats(completion: @escaping (CatsResult) -> Void) {
        guard let url = URL(string: Constants.mainUrl) else { return }
        let urlRequest = URLRequest(url: url)
        httpClient.request(url: urlRequest, completion: completion)
    }
}
