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
        categoryTitle.text = "Technology"
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
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
