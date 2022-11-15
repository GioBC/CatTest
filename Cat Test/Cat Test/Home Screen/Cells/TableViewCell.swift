//
//  TableViewCell.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var moreInformationButton: UIButton!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var intelligenceNumberLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    /// Load all the view vars
    /// - Parameter viewModel: viewModel needed to load the cell
    func configCell(viewModel: CatViewModel) {
        raceNameLabel.text = viewModel.race
        originLabel.text = viewModel.origin
        intelligenceNumberLabel.text = viewModel.intelligence
        catImage.image = viewModel.image
    }
    
}
