//
//  ViewController.swift
//  PuchninaPracticeApp
//
//  Created by Анастасия Пучнина on 17/10/2018.
//  Copyright © 2018 Анастасия Пучнина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func save(_ sender: Any) {
        if nameTextField.text?.isEmpty != true
        {
            performSegue(withIdentifier: "profileSegueId", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profileController = segue.destination as? ProfileViewController else { return }
        profileController.nameString = nameTextField.text!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

