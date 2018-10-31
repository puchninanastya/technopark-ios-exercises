//
//  CellViewController.swift
//  TableViewSwift
//
//  Created by Анастасия Пучнина on 24/10/2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {

    @IBOutlet weak var CellLabel: UILabel!
    
    var myCellString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CellLabel.text = myCellString
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
