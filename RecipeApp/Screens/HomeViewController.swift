//
//  HomeViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
      
        label.textColor = .black
        label.textAlignment = .center
        label.text = "The Meal By: Kary Martinez"
        label.font = UIFont(name: "Optima-BOld", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(self.startButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func startButtonPressed(sender: UIButton) {
        
        self.navigationController?.pushViewController(CategoryViewController(), animated: true)
    }
    private func addSubviews() {
    self.view.addSubview(startButton)
    self.view.addSubview(titleLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        settingUpConstraints()
    
    }
    
    private func settingUpConstraints() {
    NSLayoutConstraint.activate([
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
        startButton.widthAnchor.constraint(equalToConstant: 140),
        startButton.heightAnchor.constraint(equalToConstant: 35)
         
        ])
    }

}
