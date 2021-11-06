//
//  MealCollectionViewCell.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/6/21.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    
    var mealInfo: Meal!
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "placeHolder"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    
    private func settitleNameConstraints() {
     addSubview(titleLabel)
     titleLabel.translatesAutoresizingMaskIntoConstraints = false
     titleLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 11).isActive = true
     titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
     titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
     addSubview(titleLabel)
    settitleNameConstraints()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
