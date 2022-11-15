//
//  CatCellViewModel.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
import UIKit

class CatViewModel {
    private let model: CatModel
    let image: UIImage
    
    init(model: CatModel, image: UIImage) {
        self.model = model
        self.image = image
    }
    
    var race: String {
        return model.name
    }
    
    var origin: String {
        return model.origin
    }
    
    var intelligence: String {
        return "Inteligencia: \(model.intelligence)"
    }
    
    var catDescription: String {
        return model.description
    }
    
    var url: String? {
        return model.image?.url
    }
}
