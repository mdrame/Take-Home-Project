//
//  News.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/11/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation
import UIKit


struct News: Codable {
    var status: String
    var articles: [NewsBody]
}

struct NewsBody: Codable {
    var title: String
    var url: String
    var urlToImage: String
}


//struct HardNews: Codable {
//    var title: String
//    var thumbNail: UIImage
//}
