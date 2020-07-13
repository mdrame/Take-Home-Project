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
    var selectedCategoryString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        getSelectedStringAndFetchData(selectedCategory: selectedCategoryString)
        
    }
    
    // Instances
    var networking = Networking()
    
    // Global Funtion
    func tableViewSetUp() {
        view.addSubview(newsTableView)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    func getSelectedStringAndFetchData(selectedCategory title: String?) {
        guard let transferedTitle = title else { return }
        print(transferedTitle)
    }
    
    // Outlets
    @IBOutlet weak var newsTableView: UITableView!
    
    // Actions
    
    
}


extension CategpryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! NewsTableViewCustomCell
        cell.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "DetailVC") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
