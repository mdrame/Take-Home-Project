//
//  ViewController.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/9/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle()
    }
    
    
    // Instances
    var  appStringModel = AppStringModel()
    
    // Global Funtion
    func navigationTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = appStringModel.homeTitle
    }
    
    // Outlets
   
    
    // Actions
  
    

    
    
    
    
    
    
    
    
    


}

