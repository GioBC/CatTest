//
//  HomeViewModel.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import Foundation
import UIKit

class HomeViewModel {
    
    // MARK: - models for Tableview
    var catList: [CatViewModel] = []
    var filteredCatList: [CatViewModel] = []
    
    // MARK: - Constants
    struct Constants {
        static let defaultImage: UIImage = UIImage(named: "cat-profile")!
    }
    
    var searchText: String = "" {
        didSet {
            guard !searchText.isEmpty else {
                filteredCatList = catList
                return
            }
            filteredCatList = filteredCatList.filter { return $0.race.lowercased().contains(searchText.lowercased())  }
        }
    }
    
    // MARK: completion clousure
    var onLoadData: (() -> Void)?
    
    // MARK: init properties
    let api: CatAPIProtocol
    let imageLoader: ImageLoaderProtocol
    
    init(api: CatAPIProtocol, imageLoader: ImageLoaderProtocol) {
        self.api = api
        self.imageLoader = imageLoader
    }
    
    /// load the cats from the API
    func getCats() {
        api.getCats { result in
            switch result {
            case .success(let catsArray):
                self.createViewModels(models: catsArray)
            case .failure(let error):
                print("Error to get data")
                print(error)
            }
        }
    }
    
    private func createViewModels(models: [CatModel]) {
        loadAllImages(models: models) { images in
            self.catList = models.enumerated().map { index, value in
                return CatViewModel(model: value, image: images[index])
                
            }
            self.filteredCatList = self.catList
            self.onLoadData?()
        }
    }
    
    
    /// Load all the images and send the entiere array loaded
    /// - Parameters:
    ///   - models: every model without image loaded
    ///   - completion: gets all the images in an array related by its index
    private func loadAllImages(models: [CatModel], completion: @escaping ([UIImage]) -> Void) {
        
        let dispatchGroup = DispatchGroup()
        var images: [UIImage] = []
        
        models.enumerated().forEach { index, model in
            images.append(Constants.defaultImage)
            guard let imageURL = model.image?.url,
                  let url = URL(string: imageURL) else {
                return
            }
            dispatchGroup.enter()
            self.imageLoader.loadImage(url: url) { image in
                dispatchGroup.leave()
                images.insert(image, at: index)
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(images)
        }
        
    }
}
