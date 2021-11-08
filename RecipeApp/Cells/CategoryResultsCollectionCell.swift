//
//  MealCollectionViewCell.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/6/21.
//

import UIKit

class CategoryResultsCollectionCell: UICollectionViewCell {
    
    var mealInfo: Meal!
    
    lazy var mealnameLabel: UILabel = {
        let label = UILabel()
        label.text = "placeHolder"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
     
    private func settitleConstraints() {
     addSubview(mealnameLabel)
    mealnameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mealnameLabel.centerXAnchor.constraint(equalTo:  centerXAnchor),
            mealnameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    // refactor contraints
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
       addSubview(mealnameLabel)
       settitleConstraints()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
