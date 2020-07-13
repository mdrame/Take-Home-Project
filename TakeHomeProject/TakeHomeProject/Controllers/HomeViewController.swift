//
//  ViewController.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/9/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    // Global Var
    var listOfNews: [NewsBody] = []
    var selectedCategoryString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle()
        collectionViewSetUp()
       
    }
    
    
    
    // Instances
    var appStringModel = AppStringModel()
    var networking = Networking()
    var collectionviewCategory = CollectionViewCategory()
    
    // Global Funtion
    func navigationTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = appStringModel.homeTitle
    }
    
    
    
    func collectionViewSetUp() {
        view.addSubview(newsCollectionView)
        newsCollectionViewConstraint()
    }
    
    var newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let newsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsCollectionView.register(NewsCollectionViewCustomCell.self, forCellWithReuseIdentifier: NewsCollectionViewCustomCell.cellIdentifier)
        newsCollectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        newsCollectionView.showsVerticalScrollIndicator = false
        newsCollectionView.layer.cornerRadius = 15
        return newsCollectionView
    }()
    
    func newsCollectionViewConstraint() {
        NSLayoutConstraint.activate([
            newsCollectionView.topAnchor.constraint(equalTo: self.searchKit.bottomAnchor, constant: 5),
            newsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            newsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            newsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
    }
    
    // Outlets
    @IBOutlet weak var searchKit: UISearchBar!
    
    
    // Actions
    
    
    
    
}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionviewCategory.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCustomCell.cellIdentifier, for: indexPath) as! NewsCollectionViewCustomCell
        cell.categoryTitle.text =  collectionviewCategory.category[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2.1 , height: collectionView.frame.size.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "categoryVC") as? CategpryViewController else { return }
        let selectedIndex = collectionView.indexPathsForSelectedItems
//        print(selectedIndex)
        let path = selectedIndex?[0]
        let row = path?[1]
//        print(row!)
        let selectedRowTitle = collectionviewCategory.category[row!]
//        print(selectedRowTitle)
        vc.selectedCategoryString = selectedRowTitle
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
    // Delegates
    
    
    
    
    
    
    
    
}
