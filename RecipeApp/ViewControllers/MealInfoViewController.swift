//
//  MealInfoViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/6/21.
//

import UIKit

class MealInfoViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .vertical
          layout.minimumInteritemSpacing = 0
          layout.itemSize = CGSize(width: view.frame.width, height: 400)
          let BrowserView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

         // BrowserView.register(browserViewCollectionViewCell.self, forCellWithReuseIdentifier: "theCell")
          BrowserView.backgroundColor = .white
         // BrowserView.dataSource = sel        // BrowserView.delegate = self
          
          return BrowserView
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConstraints()

    }
    private func collectionViewConstraints() {
        
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        }
    }
