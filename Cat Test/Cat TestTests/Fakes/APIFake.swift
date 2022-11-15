//
//  APIFake.swift
//  Cat TestTests
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
@testable import Cat_Test

class FakeAPI: CatAPIProtocol {
    func getCats(completion: @escaping (CatsResult) -> Void) {
        
        let cat1 = CatModel(id: "", name: "Cat1", temperament: "Temperament1", origin: "Origin1", description: "Description", intelligence: 0, image: nil)
        let cat2 = CatModel(id: "", name: "Cat2", temperament: "Temperament2", origin: "Origin2", description: "Description2", intelligence: 0, image: nil)
        completion(.success([cat1, cat2]))
        
    }
}
