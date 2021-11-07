//
//  DetailViewControllerViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/7/21.
//

import UIKit

class DetailViewControllerViewController: UIViewController {
   
    var currentDetails = [MealID] ()
    
    lazy var NameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.sizeToFit()
        return label
    }()
    func addSubviews() {
    self.view.addSubview(NameLabel)
  
}
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setNameConstraints()
   
    }
    
    private func getPost() {
  //      NameLabel.text = currentDetails.
    }
    
    
    private func setNameConstraints() {
  NameLabel.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate([
 NameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
  NameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
 NameLabel.widthAnchor.constraint(equalToConstant: 350),
 NameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
