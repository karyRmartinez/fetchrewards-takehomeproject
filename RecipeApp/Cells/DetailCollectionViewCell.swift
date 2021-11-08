//
//  DetailCollectionViewCell.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/7/21.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
     
    var detailinfo: MealDetails!
    
    
    lazy var NameLabel: UILabel = {
        let label = UILabel()
        label.text = "placeHolder"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var InstructionLabel: UITextView = {
        let label = UITextView()
        label.textColor = .black
        label.backgroundColor = UIColor(white: 0.97, alpha: 1)
        label.font = .italicSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.font = label.font?.withSize(21)
        label.isScrollEnabled = true
        label.isSelectable = false
        label.isEditable = false
        return label
    }()
    func set(details: String) {
        InstructionLabel.text = details
    }
    private func settitleConstraints() {
      addSubview(NameLabel)
     NameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NameLabel.centerXAnchor.constraint(equalTo:  centerXAnchor),
            NameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
          }
     
    func InstructionsLabelConstraints() {
        addSubview(InstructionLabel)
        InstructionLabel.translatesAutoresizingMaskIntoConstraints = false
        InstructionLabel.topAnchor.constraint(equalTo: NameLabel.bottomAnchor, constant: 2).isActive = true
        InstructionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        InstructionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        InstructionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
       settitleConstraints()
        InstructionsLabelConstraints()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
