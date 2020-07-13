//
//  NewsCollectionViewCustomCell.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/12/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class NewsCollectionViewCustomCell: UICollectionViewCell {
    static var cellIdentifier = "CustomNewsCell"
    
    lazy var categoryTitle: UILabel = {
        let categoryTitle = UILabel(frame: .zero)
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        categoryTitle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        categoryTitle.font = UIFont(name: "Arial", size: 25)
        categoryTitle.textAlignment = .center
        return categoryTitle
    }()
    
    func categoryTitleConstrain() {
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            categoryTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            categoryTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            categoryTitle.trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 0),
            categoryTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryTitle.centerXAnchor.constraint(equalToSystemSpacingAfter: contentView.centerXAnchor, multiplier: 0)
        ])
    }
    
    
    func setupViews() {
        contentView.addSubview(categoryTitle)
        categoryTitleConstrain()
        contentLayout()
        
    }
    
    
//    func setCategoryData(listof string: CollectionViewCategory) {
//        categoryTitle.text = string.category
//    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contentLayout() {
        backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        layer.cornerRadius = 15
    }
    
    
    
}
