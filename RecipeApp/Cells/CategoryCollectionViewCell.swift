//
//  browserViewCollectionViewCell.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
  
    var CategoryInfo: Category?
        
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "placeHolder"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
  
   //MARK: Constraints
   private func settitleNameConstraints() {
        addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
    titleLabel.centerXAnchor.constraint(equalTo:  centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
      }
 
    override init(frame: CGRect) {
           super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(titleLabel)
       settitleNameConstraints()
       
       }

  required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
