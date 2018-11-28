//
//  CellModel.swift
//  TableViewSwift
//
//  Created by a.puchnina on 14.03.2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

class CellModel : Codable {
    var name: String?
    var type: String?
    var episodes: String?
    var episodeLength: String?
    var description: String?
    var image: UIImage?
    
    enum CodingKeys : String, CodingKey {
        case name
        case type
        case episodes
        case episodeLength = "episode_length"
        case description
    }
}

let animesUrlsArray = [
    ("https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/attack_on_titan.json",
     "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/attack_on_titan.jpg"),
    ("https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/beck.json",
     "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/beck.jpg"),
    ("https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/code_geass.json",
     "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/code_geass.jpg"),
    ("https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/fma.json",
     "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/fma.jpg"),
    ( "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/gto.json",
      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/gto.jpg"),
    ( "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/monster.json",
      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/monster.jpg"),
    ( "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/opm.json",
      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/opm.jpg"),
    ( "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/steinsgate.json",
      "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/steinsgate.jpg")
];
