//
//  CategoryViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var allRecipes = [Category]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 400)
        let BrowserView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        BrowserView.register(browserViewCollectionViewCell.self, forCellWithReuseIdentifier: "theCell")
        BrowserView.backgroundColor = .white
        BrowserView.dataSource = self
       BrowserView.delegate = self
        
        return BrowserView
    }()
    
    func addSubview() {
    self.view.addSubview(collectionView)
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        fetchData()
       collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewConstraints()
    }
    private let categorylist = APIClient<CategoryList>()
    
    private func fetchData() {
        categorylist.fetchData(url: APIHelper.URL.link + "categories.php"  ) { [weak self] (result) in
            switch result {
            case .failure(let error):
              print(error)
            case .success(let outcome):
                self?.allRecipes = outcome.categories
            }
          }
        }
    private func collectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
         collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
         collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
         collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true


    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRecipe = allRecipes[indexPath.row]
       // let detailViewController = DetailViewController()
       // detailViewController.currentRecipes = selectedRecipe
       // self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allRecipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath) as! browserViewCollectionViewCell
        let currentRecipe = allRecipes[indexPath.row]
        cell.titleLabel.text = currentRecipe.name
    
       
      
        return cell
    }
    
    
}

