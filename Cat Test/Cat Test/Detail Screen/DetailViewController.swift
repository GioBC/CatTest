//
//  DetailViewController.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var catImage: UIImageView!
    
    // MARK: Init properties
    let viewModel: CatViewModel
    
    init(viewModel: CatViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: "DetailViewController"), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        raceNameLabel.text = viewModel.race
        descriptionTextView.text = viewModel.catDescription
        catImage.image = viewModel.image
    }

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
