//
//  CustomTableViewCell.swift
//  TableViewSwift
//
//  Created by d.taraev on 14.03.2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var animeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fillCell(with model: CellModel) {
        titleLabel.text = model.name
        episodesLabel.text = "(\(model.episodes!) episodes)"
        animeImage.image = model.image
    }
}
