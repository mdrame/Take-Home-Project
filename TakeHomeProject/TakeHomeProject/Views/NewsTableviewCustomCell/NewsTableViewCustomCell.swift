//
//  NewsTableViewCustomCell.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/12/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class NewsTableViewCustomCell: UITableViewCell {
    static var cellIdentifier = "newsCardCell"
    
    
    lazy var categoryTableViewTitle: UILabel = {
        let categoryTableViewTitle = UILabel(frame: .zero)
        categoryTableViewTitle.translatesAutoresizingMaskIntoConstraints = false
        categoryTableViewTitle.text = "Test"
        categoryTableViewTitle.textColor = #colorLiteral(red: 0.1318426728, green: 0.1439217925, blue: 0.158605963, alpha: 1)
        categoryTableViewTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        categoryTableViewTitle.numberOfLines = 100
        categoryTableViewTitle.sizeToFit()
        categoryTableViewTitle.textAlignment = .left
        return categoryTableViewTitle
    }()
    
    func categoryTableViewTitleConstrain() {
        NSLayoutConstraint.activate([
            categoryTableViewTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            categoryTableViewTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoryTableViewTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            categoryTableViewTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120)
        ])
    }
    
    lazy var categoryTableViewImage: UIImageView = {
        let categoryTableViewImage = UIImageView(frame: .zero)
        categoryTableViewImage.translatesAutoresizingMaskIntoConstraints = false
        categoryTableViewImage.contentMode = .scaleAspectFit
        categoryTableViewImage.image = #imageLiteral(resourceName: "404")
        categoryTableViewImage.clipsToBounds = true
        categoryTableViewImage.layer.cornerRadius = 20
        return categoryTableViewImage
    }()
    
    func categoryTableViewImageConstrain() {
        NSLayoutConstraint.activate([
            categoryTableViewImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            categoryTableViewImage.leadingAnchor.constraint(equalTo: categoryTableViewTitle.trailingAnchor, constant: 2),
            categoryTableViewImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            categoryTableViewImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    
    
    func setUpTitle(with newsBody: NewsBody) {
        categoryTableViewTitle.text = newsBody.title
        
    }
    
    func decodeImageURLAndSet(data: NewsBody){
        let imageString: String? = data.urlToImage
        if let imageURL = URL(string: imageString ?? "404.png" ) {
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: imageURL) else { return }
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.categoryTableViewImage.image = image!
                }
            }
        }
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryTableViewTitle)
        categoryTableViewTitleConstrain()
        contentView.addSubview(categoryTableViewImage)
        categoryTableViewImageConstrain()
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init not implemented")
    }
    
}
