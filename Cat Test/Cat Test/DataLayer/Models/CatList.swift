//
//  CatList.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation

struct CatModel: Codable {
    var id: String
    var name: String
    var temperament: String
    var origin: String
    var description: String
    var intelligence: Int
    var image: CatImageModel?
}

struct CatImageModel: Codable {
    var id: String?
    var url: String?
}
