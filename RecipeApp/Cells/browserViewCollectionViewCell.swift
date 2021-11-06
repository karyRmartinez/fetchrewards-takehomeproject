//
//  browserViewCollectionViewCell.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import UIKit

class browserViewCollectionViewCell: UICollectionViewCell {
  
    var recipeInfo: Category?
        
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "placeHolder"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
  
   //MARK: Constraints
       
 
       
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
