//
//  ViewController.swift
//  TableViewSwift
//
//  Created by d.taraev on 14.03.2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "customCell"
    @IBOutlet weak var tableView: UITableView!
    var modelArray = [CellModel]()
    var selectedAnime : CellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillModelArray()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func fillModelArray() {
        let data = animeData.data(using: .utf8)!
        do {
            modelArray = try JSONDecoder().decode([CellModel].self, from: data)
        } catch {
            print(error)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
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
        selectedAnime = modelArray[indexPath.row]
        print("You tapped at cell with value: \(String(describing: selectedAnime?.name)))")
        performSegue(withIdentifier: "CellSegueId", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cellController = segue.destination as? CellViewController else { return }
        cellController.animeCell = selectedAnime
    }
}

