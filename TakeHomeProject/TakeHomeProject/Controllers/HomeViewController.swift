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
    var listOfNews: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle()
        networking.fetchData { (listOfNewsObject) in
            self.listOfNews = listOfNewsObject
            print("News 📰 \(self.listOfNews)")
        }
        collectionViewSetUp()
    }
    
    
    // Instances
    var appStringModel = AppStringModel()
    var networking = Networking()
    
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



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCustomCell.cellIdentifier, for: indexPath) as! NewsCollectionViewCustomCell
        cell.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width / 2, height: collectionView.frame.size.height / 4)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 400, height: 400)
      }
    
    
    
    
    
    // Delegates
    
    
    
    
    
    
    
    
}
