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
    var listOfNews: [News] = []
    var newsBodyList : [NewsBody] = []{
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
         getSelectedStringAndFetchData(selectedCategory: selectedCategoryString)
    }
    
    // Instances
    var networking = Networking()
    
    // Global Funtion
    func tableViewSetUp() {
        view.addSubview(newsTableView)
        newsTableViewConstrain()
    }
    
    lazy var  newsTableView: UITableView = {
        let newsTableView = UITableView(frame: .zero)
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.register(NewsTableViewCustomCell.self, forCellReuseIdentifier: NewsTableViewCustomCell.cellIdentifier)
        return newsTableView
    }()
    
    func newsTableViewConstrain() {
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    
    func getSelectedStringAndFetchData(selectedCategory title: String?) {
        guard let transferedTitle = title else { return }
        networking.fetchData(search: transferedTitle) { (NewsBody) in
            self.listOfNews.append(NewsBody)
            //            print("Category ‼️ \(self.listOfNews)")
            self.newsBodyList =  self.filterAndGetData(listof: self.listOfNews)
            DispatchQueue.main.async {
                self.title = title!
                self.newsTableView.reloadData()
            }
            print("Before populating TV: \(self.newsBodyList)")
        }
    }
    
    
    func filterAndGetData(listof object: [News])->[NewsBody]{
        var allNewsArticles:[NewsBody] = []
        for news in object {
            //            print("Filter Nes 📰 \(news)")
            for article in news.articles! {
                allNewsArticles.append(article)
            }
        }
        return allNewsArticles
    }
    
    // Outlets
    
    // Actions
    
    
}


extension CategpryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsBodyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCustomCell.cellIdentifier, for: indexPath) as! NewsTableViewCustomCell
//        cell.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        cell.setUpTitle(with: newsBodyList[indexPath.row])
        cell.decodeImageURLAndSet(data: newsBodyList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "DetailVC") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    
    
    
}
