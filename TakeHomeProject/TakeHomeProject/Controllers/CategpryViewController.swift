//
//  CategpryViewController.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/9/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class CategpryViewController: UIViewController {
    // Global Var
    var listOfNews: [News]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let news = listOfNews else { return }
        print("News in category vc \(news)")

    }
    
    
    // Instances
    
    // Global Funtion
    
    // Outlets
    
    // Actions
    

}
