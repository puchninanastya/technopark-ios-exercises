//
//  ViewController.swift
//  TableViewSwift
//
//  Created by d.taraev on 14.03.2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "CustomTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    var modelArray = [CellModel]()
    var selectedCellString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fillModelArray()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func fillModelArray() {
        for i in 1...5 {
            let model = CellModel()
            model.title = "Cell number \(i)"
            modelArray.append(model)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let castedCell = cell as? CustomTableViewCell {
            castedCell.fillCell(with: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellString = modelArray[indexPath.row].title
        print("You tapped at cell with value: \(String(describing: selectedCellString))")
        performSegue(withIdentifier: "CellSegueId", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cellController = segue.destination as? CellViewController else { return }
        cellController.myCellString = selectedCellString
    }
}

