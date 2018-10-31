//
//  ProfileViewController.swift
//  PuchninaPracticeApp
//
//  Created by Анастасия Пучнина on 17/10/2018.
//  Copyright © 2018 Анастасия Пучнина. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var nameString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameString
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
