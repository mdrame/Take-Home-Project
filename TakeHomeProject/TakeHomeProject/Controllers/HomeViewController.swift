//
//  ViewController.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/9/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var listOfNews: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle()
        networking.fetchData { (listOfNewsObject) in
            self.listOfNews = listOfNewsObject
            print("News 📰 \(self.listOfNews)")
        }
    }
    
    
    // Instances
    var appStringModel = AppStringModel()
    var networking = Networking()
    
    // Global Funtion
    func navigationTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = appStringModel.homeTitle
    }
    
    // Outlets
   
    
    // Actions
  
    

    
    
    
    
    
    
    
    
    


}

