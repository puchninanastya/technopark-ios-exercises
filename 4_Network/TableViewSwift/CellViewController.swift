//
//  CellViewController.swift
//  TableViewSwift
//
//  Created by Анастасия Пучнина on 24/10/2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var episodesLengthLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var animeImage: UIImageView!
    
    var animeCell : CellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = animeCell?.name
        typeLabel.text = animeCell?.type
        episodesLabel.text = animeCell?.episodes
        episodesLengthLabel.text = animeCell?.episodeLength
        descriptionTextView.text = animeCell?.description
        animeImage.image = animeCell?.image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
