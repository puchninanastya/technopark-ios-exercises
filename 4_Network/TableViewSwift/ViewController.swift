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
    
    func getAnime(withJsonByUrl animeJsonUrl: URL, withImageByUrl animeImageUrl: URL) {
        
        URLSession.shared.dataTask(with: animeJsonUrl) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                let animeModel = try JSONDecoder().decode(CellModel.self, from: data)
                    
                DispatchQueue.global().async {
                    guard let data = try? Data(contentsOf: animeImageUrl) else {
                        return
                    }
                    
                    animeModel.image = UIImage(data: data)
                    self.modelArray.append(animeModel)
                    
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            } catch {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    func fillModelArray() {
        for animeUrls in animesUrlsArray {
            guard let animeJsonUrl = URL(string: animeUrls.0) else { return }
            guard let animeImageUrl = URL(string: animeUrls.1) else { return }
            self.getAnime(withJsonByUrl: animeJsonUrl, withImageByUrl: animeImageUrl)
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

